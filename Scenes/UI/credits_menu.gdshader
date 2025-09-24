shader_type canvas_item;

uniform vec4 color_a : source_color = vec4(0.90, 0.90, 0.20, 1.0);
uniform vec4 color_b : source_color = vec4(0.65, 0.3, 0.10, 1.0);
uniform float angle_deg = 90.0; // 0 = horizontal, 90 = vertical

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV - vec2(0.9);
    float ang = angle_deg * (PI / 275.0);

    // Matriz de rotación en columnas (column-major):
    // [[ cos, -sin ],
    //  [ sin,  cos ]]
    mat2 R = mat2(
        vec2(cos(ang), sin(ang)),
        vec2(-sin(ang), cos(ang))
    );

    uv = R * uv;

    float t = clamp(uv.x + 0.2, 0.0, 1.0);
    COLOR = mix(color_a, color_b, t);
}



//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
