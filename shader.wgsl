@vertex
fn vs_main(@builtin(vertex_index) in_vertex_index: u32) -> @builtin(position) vec4<f32> {
    let idx = i32(in_vertex_index);
    
    // 计算在2x2网格中的位置
    // 对于三角形条带：0,1,2,3,4,5
    // x: 0->-1, 1->-1, 2->1, 3->-1, 4->1, 5->1
    // y: 0->-1, 1->1,  2->-1, 3->1,  4->1, 5->-1
    
    var x: f32;
    var y: f32;
    
    // 方法1：直接映射（清晰易懂）
    switch idx {
        case 0: { x = -1.0; y = -1.0; }
        case 1: { x = -1.0; y =  1.0; }
        case 2: { x =  1.0; y = -1.0; }
        case 3: { x = -1.0; y =  1.0; }
        case 4: { x =  1.0; y =  1.0; }
        case 5: { x =  1.0; y = -1.0; }
        default: { x = 0.0; y = 0.0; }
    }
    
    return vec4<f32>(x, y, 0.0, 1.0);
}

@fragment
fn fs_main(@builtin(position) frag_coord: vec4<f32>) -> @location(0) vec4<f32> {
    // 转换为归一化坐标 [0, 1]
    let screen_size = vec2<f32>(640.0, 480.0); // 需要知道窗口大小
    var uv = (2.0 * frag_coord.xy - screen_size) / min(screen_size.x, screen_size.y);
    //uv = 2.0 * uv - 1.0;
    //uv.x *= 640.0 / 480.0;
    let c = length(uv);
    return vec4<f32>(c, c, c, 1.0);
}
