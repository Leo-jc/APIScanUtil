// napi_init.cpp — HarmonyOS NAPI 模块注册示例（测试夹具）
// 覆盖 napi_* 桥接接口与原生 OH_* 接口的混合使用。
#include "napi/native_api.h"
#include <hilog/log.h>
#include <memory>

#define LOG_TAG "TestNapi"

// napi_value 构造与参数获取
static napi_value Add(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double a = 0, b = 0;
    napi_get_value_double(env, args[0], &a);
    napi_get_value_double(env, args[1], &b);

    napi_value result = nullptr;
    napi_create_double(env, a + b, &result);
    return result;
}

// NAPI 模块注册（napi_module / napi_module_register）
static napi_module testModule = {
    .nm_version = 1,
    .nm_filename = "test_napi.cpp",
};

napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

// 模块注册入口
extern "C" __attribute__((constructor)) void RegisterTestModule(void) {
    napi_module_register(&testModule);
}
