shader_type canvas_item;

uniform vec4 glow_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float intensity = 1;
uniform float radius = 0.8;

void fragment() {
    // Calculate distance from the center (0.5, 0.5)
    float dist = distance(UV, vec2(0.5));
    
    // Create a smooth radial fade
    float circle = smoothstep(radius, 0.0, dist);
    
    // Apply the color and the fade to the alpha channel
    vec3 final_color = glow_color.rgb;
    float alpha = circle * intensity;
    
    COLOR = vec4(final_color, alpha);
}