// drawing_helper.cpp — HarmonyOS Native 绘图接口使用示例（测试夹具）
// 覆盖 OH_Drawing_* / OH_NativeBuffer / OH_NativeVSync 等原生 C 接口的使用点。
#include "native_drawing/drawing_canvas.h"
#include "native_drawing/drawing_path.h"
#include "native_drawing/drawing_pen.h"
#include "native_buffer/native_buffer.h"
#include <cstddef>

class DrawingHelper {
public:
    // OH_Drawing_* 接口调用链
    void DrawRoundRect(OH_Drawing_Canvas* canvas, float left, float top,
                       float right, float bottom, float radius) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
        OH_Drawing_PenSetAntiAlias(pen, true);
        OH_Drawing_Path* path = OH_Drawing_PathCreate();
        OH_Drawing_PathAddRoundRect(path, left, top, right, bottom, radius, radius);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawPath(canvas, path);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_PathDestroy(path);
        OH_Drawing_PenDestroy(pen);
    }

    // OH_NativeBuffer 接口使用
    OH_NativeBuffer* CreateBuffer(uint32_t width, uint32_t height) {
        OH_NativeBuffer_Config config;
        config.width = width;
        config.height = height;
        return OH_NativeBuffer_Alloc(&config);
    }

    void ReleaseBuffer(OH_NativeBuffer* buffer) {
        int32_t ret = OH_NativeBuffer_Unreference(buffer);
        (void)ret;
    }

private:
    OH_Drawing_Canvas* canvas_ = nullptr;
};
