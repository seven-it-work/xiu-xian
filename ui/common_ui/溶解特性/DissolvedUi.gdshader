shader_type canvas_item; // 2D 着色器

uniform sampler2D noise_tex; // 噪声纹理
uniform float dissolve_threshold : hint_range(0.0, 1.0) = 0.5; // 溶解阈值
uniform vec4 edge_color : source_color = vec4(1.0, 0.5, 0.0, 1.0); // 边缘颜色
uniform float edge_width : hint_range(0.0, 0.1) = 0.0; // 边缘宽度
uniform float edge_brightness:hint_range(1,5)=2; // 编译亮度

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    float noise_val = texture(noise_tex, UV).r;

	// 边缘强度计算
	float edge_strength=smoothstep(
		dissolve_threshold,
		dissolve_threshold+edge_width,
		noise_val
	);

    // 溶解逻辑
    if (noise_val < dissolve_threshold) {
        discard; // 丢弃像素（溶解）
    }
	//if (edge_width>0.0) {
	// 边缘颜色混合
	vec3 belended_color=mix(
		edge_color.rgb*edge_brightness,
		tex_color.rgb,
		edge_strength
	);
    COLOR=vec4(belended_color,tex_color.a);
	//}
}