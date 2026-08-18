# 鸿蒙资源泄漏 API 速查

> 从 Resource-Leak-Patterns.md 提取的 API 创建/释放配对表。本文件不增加主清单范围，只作为阶段三审查时的 API 线索速查。

## FD 泄漏 API 配对

### 文件操作

| 创建 | 释放 | Kit | 注意事项 |
|------|------|-----|---------|
| `fileIo.openSync` | `fileIo.closeSync` | CoreFileKit | 异常路径需 try-finally |
| `fileIo.open` | `fileIo.closeSync` / `fileIo.close` | CoreFileKit | 异步版同样需在所有路径 close |
| `fileIo.watch` | `watcher.close()` | CoreFileKit | 底层持有 inotify fd |

### 网络

| 创建 | 释放 | Kit | 注意事项 |
|------|------|-----|---------|
| `socket.constructTCPSocketInstance` | `tcp.close()` | NetworkKit | — |
| `socket.constructUDPSocketInstance` | `udp.close()` | NetworkKit | — |
| `socket.constructTLSSocketInstance` | `tls.close()` | NetworkKit | 封装 TCP fd |
| `socket.constructTCPSocketServerInstance` | `server.close()` + 每个 `connection.close()` | NetworkKit | server.close() 不关闭已有连接 |
| `http.createHttp` | `httpRequest.destroy()` | NetworkKit | 文档明确警告必须 destroy |
| `webSocket.createWebSocket` | `ws.close()` | NetworkKit | 同时涉及 FD 和线程泄漏 |

### 数据库

| 创建 | 释放 | Kit | 注意事项 |
|------|------|-----|---------|
| `relationalStore.getRdbStore` | `store.close()` (API 12+) | ArkData | 持有 .db/.wal/.shm 各一个 fd；API 9~11 无 close 需置 null |
| `store.querySql` / `store.query` | `resultSet.close()` | ArkData | 底层持有 SQLite cursor |

### 媒体

| 创建 | 释放 | Kit | 注意事项 |
|------|------|-----|---------|
| `image.createImageSource` | `imageSource.release()` | ImageKit | 持有底层文件 fd |
| `image.createImagePacker` | `imagePacker.release()` | ImageKit | — |
| `media.createAVPlayer` | `player.release()` | MediaKit | 通过 fdSrc 持有 fd |
| `media.createAVRecorder` | `recorder.release()` | MediaKit | 持有输出文件 fd |
| `media.createSoundPool` | `soundPool.release()` | MediaKit | 第二参数从 AudioKit 导入 |
| `media.createAVMetadataExtractor` | `extractor.release()` | MediaKit | — |
| PixelMap (`source.createPixelMap`) | `pixelMap.release()` | ImageKit | 持有 DMA/共享内存 fd |
| Picture | `picture.release()` | ImageKit | — |

### 子进程与 IPC

| 创建 | 释放 | Kit | 注意事项 |
|------|------|-----|---------|
| `childProcess.spawn` | 关闭 stdin/stdout/stderr 管道 fd | BasicServicesKit | — |
| `rpc.MessageSequence.readFileDescriptor` | `fileIo.closeSync(fd)` | IPCKit | IPC 传递的 fd 被内核 dup，双方各自关闭 |

### NDK 层

| 创建 | 释放 | 注意事项 |
|------|------|---------|
| `open()` | `close()` | — |
| `fopen()` | `fclose()` | — |
| `opendir()` | `closedir()` | — |
| `socket()` | `close()` | — |

## 内存泄漏 API 配对

### JS/ArkTS 堆内存

| 创建 | 释放 | 注意事项 |
|------|------|---------|
| `emitter.on` | `emitter.off(eventId)` | 闭包捕获的对象常驻 |
| `CommonEvent.subscribe` | `CommonEvent.unsubscribe(subscriber)` | — |
| `setInterval` | `clearInterval(timerId)` | 同时阻止 TaskPool 线程缩容 |
| `setTimeout` | `clearTimeout(timerId)` | — |

### 组件/Ability 生命周期

| 创建 | 释放 | 注意事项 |
|------|------|---------|
| `aboutToAppear` 获取资源 | `aboutToDisappear` 释放资源 | 异步创建需 isDestroyed 标志位 |
| `onCreate` 获取资源 | `onDestroy` 释放资源 | — |
| 全局 Set 持有组件引用 | `aboutToDisappear` 移除引用 | — |
| Context 存入全局 Map | `onDestroy` 移除或用 ApplicationContext | UIAbility Context 泄漏 |

### Native 内存

| 创建 | 释放 | 注意事项 |
|------|------|---------|
| `malloc` | `free` | C 层 |
| `new` | `delete` | C++ 层，优先用智能指针 |
| `mmap` | `munmap` | 持续占用虚拟地址空间 |
| `napi_create_reference` | `napi_delete_reference` | 阻止 GC 回收 JS 对象 |
| `napi_wrap(&ref)` | `napi_delete_reference` | 传 nullptr 则不需要 |
| `napi_open_handle_scope` | `napi_close_handle_scope` | 循环中创建大量 napi_value 需子 scope |

### 鸿蒙特有

| 创建 | 释放 | 注意事项 |
|------|------|---------|
| `dataPreferences.getPreferences` | `removePreferencesFromCache` | 加载全量数据常驻内存 |
| `@State` 追踪大对象 | `aboutToDisappear` 置空 | 路由栈保持时不释放 |

## 线程泄漏 API 配对

| 创建 | 释放 | 注意事项 |
|------|------|---------|
| `new worker.ThreadWorker` | `worker.terminate()` | 每个持有独立 JS 引擎 |
| `registerGlobalCallObject` | `unregisterGlobalCallObject` | Worker 持有强引用 |
| `taskpool.execute(Task)` | `taskpool.cancel(task)` | 需保存 Task 引用 |
| `taskpool.LongTask` | `taskpool.terminateTask(longTask)` | 唯一需手动管理线程生命周期的机制 |
| `taskpool.executePeriodically` | `taskpool.cancel(task)` | 周期任务需保存引用 |
| `pthread_create` | `pthread_join` | NDK 层 |
| `napi_create_threadsafe_function` | `napi_release_threadsafe_function` | 需先停止后台线程 |
| `napi_create_ark_runtime` | `napi_destroy_ark_runtime` | 最多 64 个，与 Worker 共享 80 线程配额 |

## 跨类型复合泄漏速查

| 资源 | FD 角度 | 内存角度 | 线程角度 |
|------|---------|---------|---------|
| WebSocket | `ws.close()` 释放 socket fd | `ws.off()` 取消订阅闭包 | 心跳定时器 `clearInterval`，重连线程 |
| TCP Socket | `tcp.close()` 释放 fd | — | 后台接收线程 |
| PixelMap | `source.release()` 释放底层文件 fd | `pixelMap.release()` 释放图像缓冲区 | — |
| ImageSource | `source.release()` 释放 fd | — | — |
| HTTP 请求 | `httpRequest.destroy()` 释放 fd | 回调闭包持有 Context | — |
| 事件订阅 + 网络 | emitter.on 闭包持有 fd | 闭包持有 this → Context | — |
| 缓存 + 图片 | — | 缓存 Map 无限增长 | — |
| Worker | — | registerGlobalCallObject 强引用 | Worker 线程未 terminate |
| 定时器 | — | 闭包捕获对象 | 阻止 TaskPool 线程缩容 |
