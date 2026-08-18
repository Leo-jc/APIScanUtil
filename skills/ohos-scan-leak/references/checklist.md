## 2. 主清单

以下清单是本 skill 的唯一检查范围。清单项写"要找的泄漏模式和典型未释放条件"，不是当前仓库的具体 bug；具体文件、行号、资源关系、增长方式和后果写在 Finding 后文。每个最终 finding 选择一个一级分类并写入 `message` 第一行；第二行写 `具体检查方向：<二级分类>`，但二级分类不作为列表统计项。reference 只补充成对案例、释放路径和误判说明。

### A. C/C++ 内存与对象所有权

#### A1. 分配和异常路径

- **缺陷模式**：分配成功后在提前返回、错误处理或异常退出路径中没有释放。
- **典型错误条件**：malloc/new 后提前 return/goto 跳过 free/delete；try-catch 中 catch 分支直接 return 不释放已分配对象；多步分配中第二步失败但第一步已分配的内存未释放。
- **适用**：C/C++
- **误判边界**：分配在同一个控制流块内紧随 free/delete（如分配-使用-释放三段式），中间没有分支出口；使用 RAII 智能指针（unique_ptr/shared_ptr）管理生命周期且无裸指针泄露；分配在栈上或由框架托管回收，不报。

#### A2. 对象所有权转移后无人释放

- **缺陷模式**：对象交给成员、容器、回调、全局表或跨语言层后没有明确的释放责任。
- **典型错误条件**：对象 push 进全局 vector/map 后无移除路径；回调闭包捕获堆对象但注册后永不注销；跨 NAPI 传递对象后 native 侧和 JS 侧都认为对方负责释放。
- **适用**：C/C++、跨语言场景
- **误判边界**：容器有明确的生命周期边界（如请求作用域的 vector 在请求结束时整体清理）；所有权通过注释或接口契约明确约定且接收方有释放逻辑。

#### A3. 容器与对象残留

- **缺陷模式**：map、list、vector、缓存或队列持续保存已关闭/已销毁对象，没有移除和回收路径。
- **典型错误条件**：连接关闭后仍保留在连接池 map 中；组件销毁后全局 Set 未 remove 引用；缓存淘汰只删 key 不释放 value 持有的 native 资源。
- **适用**：所有语言
- **误判边界**：容器有容量上限和淘汰策略，淘汰时正确释放对象和关联资源；容器生命周期与所属对象一致，随属主销毁而整体释放。

#### A4. 循环引用和闭包长期持有

- **缺陷模式**：shared_ptr 环、Promise、回调或闭包捕获对象，导致生命周期结束后仍无法回收。
- **典型错误条件**：A 持有 shared_ptr\<B\>、B 持有 shared_ptr\<A\> 形成环；Promise 链回调捕获 this 指针且永不 resolve/reject；闭包隐式捕获大对象但只使用小部分字段。
- **适用**：C/C++（shared_ptr）、ArkTS/JS（闭包）
- **误判边界**：环上有 weak_ptr 打断强引用链；Promise 在有限时间内必定 settle 且回调不持有长生命周期引用；闭包捕获的是基本类型或短生命周期局部变量。

#### A5. NDK 层 FD 泄漏

- **缺陷模式**：`open`/`fopen`/`opendir`/`socket` 获取 fd 后无对应 `close`/`fclose`/`closedir`。
- **典型错误条件**：open 成功后异常分支 return 不 close；循环中 open 但只在正常退出路径 close；dup/dup2 后原 fd 和新 fd 只关闭一个。
- **适用**：C/C++ NDK 层
- **误判边界**：fd 通过 dup2 重定向到标准流（stdin/stdout/stderr），由进程生命周期管理；fd 传递给子进程后由子进程负责关闭。

#### A6. mmap 映射未 munmap

- **缺陷模式**：`mmap` 映射内存区域后未 `munmap`，持续占用虚拟地址空间和物理内存。
- **典型错误条件**：mmap 后异常路径不 munmap；映射区域使用完毕但忘记调用 munmap。
- **适用**：C/C++
- **误判边界**：映射区域生命周期与进程一致（如共享内存初始化映射），不需要显式 munmap。

#### A7. pthread 线程未 join

- **缺陷模式**：`pthread_create` 创建线程后无 `pthread_join` 回收线程资源。
- **典型错误条件**：创建线程后不 join 也不 detach；join 前线程入口函数已有退出条件但主线程从未调用 join。
- **适用**：C/C++
- **误判边界**：线程已 detach 且入口函数有确定的退出条件；线程由线程池管理，池负责 join。

#### A8. 自管理线程池无 destroy

- **缺陷模式**：自建线程池不提供优雅关闭机制（设退出标志、广播条件变量、join 所有线程、释放内存）。
- **典型错误条件**：线程池类无 stop/shutdown 方法；stop 方法只设标志但不 join 等待线程退出；条件变量等待无超时且不检查退出标志。
- **适用**：C/C++
- **误判边界**：线程池生命周期与进程一致（如全局单例直到进程退出）；有完整 stop 流程且在析构函数中调用。

- API 线索：`malloc/free`、`new/delete`、`mmap/munmap`、`pthread_create/pthread_join`

### B. NAPI/FFI 资源

#### B1. 引用和句柄

- **缺陷模式**：NAPI reference、FFI 对象或全局引用未解除。
- **典型错误条件**：`napi_create_reference` 后从不 `napi_delete_reference`；`napi_wrap` 传入 `&ref` 带出引用后未删除；循环中 `napi_open_handle_scope` 无对应 `napi_close_handle_scope`，临时句柄跨批次保留。
- **适用**：NAPI/FFI 跨语言层
- **误判边界**：`napi_wrap` 传 `nullptr` 不带出引用，不需要手动删除；reference 的生命周期与关联 JS 对象一致且在 finalize 回调中删除；Handle Scope 在循环内开闭成对。

#### B2. 异步工作

- **缺陷模式**：async work、Promise 和回调资源未清理；运行环境和跨语言对象残留；TSFN 持有 ArkTS 闭包且线程未退出。
- **典型错误条件**：`napi_create_async_work` 后完成回调不释放关联数据；TSFN 创建后后台线程不退出导致闭包无法 GC；`napi_create_ark_runtime` 创建独立运行时后不销毁（最多 64 个）。
- **适用**：NAPI 异步场景
- **误判边界**：async work 的完成回调中正确释放了上下文数据和引用；TSFN 已调用 `napi_release_threadsafe_function` 且后台线程已退出。

- API 线索：`napi_create_reference/napi_delete_reference`、`napi_wrap(&ref)/napi_delete_reference`、`napi_open_handle_scope/napi_close_handle_scope`、`napi_create_threadsafe_function/napi_release_threadsafe_function`、`napi_create_ark_runtime/napi_destroy_ark_runtime`

### C. 文件、媒体和系统资源

#### C1. 文件和数据流

- **缺陷模式**：文件、流和解析对象未关闭。
- **典型错误条件**：`fileIo.openSync` 后异常路径未 `fileIo.closeSync`；异步回调异常分支直接 return 不 close；循环中持续打开文件仅关闭最后一个。
- **适用**：所有语言
- **误判边界**：文件操作在 try-finally 中确保 close；使用 `using` 或类似 RAII 模式自动关闭。

#### C2. 网络和数据库 FD 泄漏

- **缺陷模式**：TCP/UDP/WS/TLS Socket 未 close；HTTP 请求未 destroy；数据库 Store/ResultSet 未 close/release。
- **典型错误条件**：`http.createHttp` 后不调 `destroy()`（文档明确警告"必须调用 destroy 方法释放资源"）；TCP Server `close()` 不关闭已有客户端连接；`relationalStore.getRdbStore` 后 API 9~11 无 close 方法需置 null 但仍持有引用；ResultSet 不 close 底层 SQLite cursor 常驻。
- **适用**：ArkTS 网络和数据库层
- **误判边界**：HTTP 请求在 finally 块中 destroy；Socket 在 onclose 回调或页面销毁时 close；Store 在 API 12+ 使用 `store.close()`。

#### C3. 媒体和系统对象

- **缺陷模式**：媒体、播放器、连接、socket、线程、Worker 或系统对象结束后仍运行或保留。
- **典型错误条件**：ImageSource/PixelMap 不 release 导致底层文件 fd 和图像缓冲区双重泄漏；SoundPool/AVPlayer/AVRecorder 不 release；文件监控 `fileIo.watch()` 创建的 inotify fd 常驻；GPU 纹理/XComponent buffer 未释放；Drawing 对象高频创建不主动断开引用。
- **适用**：ArkTS 媒体和图形层
- **误判边界**：媒体对象在 `aboutToDisappear` 或对应页面销毁时正确 release；Drawing 对象创建频率低且 GC 可以及时回收。

- 交叉引用：PixelMap/ImageSource 同时涉及 C3（FD：底层文件 fd）和 A1（Native 内存：图像缓冲区），不 release 导致 FD+内存双重泄漏。

- API 线索：`fileIo.openSync/fileIo.closeSync`、`socket.constructTCPSocketInstance/close()`、`http.createHttp/destroy()`、`webSocket.createWebSocket/close()`、`relationalStore.getRdbStore/store.close()`、`relationalStore.querySql/resultSet.close()`、`image.createImageSource/release()`、`media.createAVPlayer/release()`、`pixelMap.release()`

### D. ArkTS/JS 监听与生命周期

#### D1. 订阅和定时器

- **缺陷模式**：事件、观察者、定时器、动画或轮询注册后在离开页面/组件时仍然存在。
- **典型错误条件**：`emitter.on` 后不 `off`，回调闭包捕获大对象常驻；`setInterval` 不 `clearInterval`，闭包及捕获对象无法 GC，且阻止 TaskPool 线程缩容；Worker 不 `terminate()` 导致独立 JS 引擎和内存常驻；TaskPool 任务引用未保存无法 cancel；LongTask 不 `terminateTask` 阻止线程缩容。
- **适用**：ArkTS/JS
- **误判边界**：emitter.on 的 eventId 在 `aboutToDisappear` 中 off；setInterval 返回的 timerId 在页面销毁时 clearInterval；Worker 在组件/页面销毁时 terminate 且 onexit 回调已触发；一次性 setTimeout 不需要 clearTimeout（已自然触发）。

#### D2. 页面和对象持有

- **缺陷模式**：页面复用和组件重建残留旧引用；全局对象和闭包长期持有；组件/Ability 生命周期不匹配。
- **典型错误条件**：重复进入页面时旧 Worker/定时器/订阅未清理；全局 Map 持有 UIAbility Context 导致 Ability 泄漏；`aboutToAppear` 获取资源但 `aboutToDisappear` 未释放；异步创建的资源晚于组件销毁且无 `isDestroyed` 标志位防护；`@State` 追踪大对象被框架响应式系统持有，组件在路由栈中不释放。
- **适用**：ArkTS 页面和组件
- **误判边界**：组件在 `aboutToDisappear` 中完整清理了所有已注册监听和持有资源；Ability 在 `onDestroy` 中释放全局引用和订阅；长生命周期对象使用 ApplicationContext 而非 UIAbility Context；`@State` 持有的是轻量基本类型。

- API 线索：`emitter.on/emitter.off`、`CommonEvent.subscribe/unsubscribe`、`setInterval/clearInterval`、`setTimeout/clearTimeout`、`worker.ThreadWorker/terminate()`、`registerGlobalCallObject/unregisterGlobalCallObject`、`taskpool.execute/cancel()`、`taskpool.LongTask/terminateTask()`、`aboutToAppear/aboutToDisappear`、`onCreate/onDestroy`、`context.getApplicationContext()`

### E. 缓存和集合

#### E1. 无界增长

- **缺陷模式**：缓存、map、set、list、队列或注册表持续加入，没有容量、淘汰或清理上限。
- **典型错误条件**：全局 Map/Set 只增不减，随运行时间无限增长；三方缓存库默认无容量限制；`dataPreferences.getPreferences` 加载全量数据常驻内存，Base64 图片等大数据存入；JSON.parse 解析的巨大对象被全局变量引用。
- **适用**：所有语言
- **误判边界**：缓存有明确的容量上限和 LRU/LFU 淘汰策略；数据结构有明确的生命周期（如请求作用域），随请求结束整体释放；Preferences 只存轻量配置项。

#### E2. 清理和记账

- **缺陷模式**：缓存淘汰只删索引不删对象或不释放 native 资源；容量记账或清理条件失效。
- **典型错误条件**：Map key 删除但 PixelMap/ImageSource 未 release（需在淘汰时显式调用 release）；size、count 或引用计数记账错误导致淘汰条件永远不成立。
- **适用**：所有带缓存淘汰逻辑的语言
- **误判边界**：淘汰时正确调用了关联 native 资源的 release/destroy 方法；记账逻辑由标准库容器 size() 驱动，不存在手写计数偏差。

- API 线索：`dataPreferences.getPreferences/removePreferencesFromCache`、`WeakRef`（API 12+）
