shader_type canvas_item;

uniform vec4 transition_color : source_color;
uniform sampler2D transition_texture: filter_nearest;
uniform float percent : hint_range(0.0, 1.0);


void fragment() {
	vec4 transition_texture_color = texture(transition_texture, UV);
	if(transition_texture_color.r > percent) {
		COLOR.a = 0.0;
	}
	else {
		COLOR = transition_color;           
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
