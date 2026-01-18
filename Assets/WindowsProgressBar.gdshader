shader_type canvas_item;

uniform float speed = 0.5;
uniform vec4 block_color : source_color = vec4(0.13, 0.38, 0.93, 1.0);
uniform vec4 bg_color : source_color = vec4(0.05, 0.05, 0.1, 1.0);

void fragment() {
    // 1. Create the small gaps between boxes
    // We use mod to create a repeating pattern of 0.0 to 1.0
    float raw_grid = mod(UV.x * 40.0, 1.0); 
    // step(0.3, ...) creates a box that is 70% blue and 30% gap
    float boxes = step(0.05, raw_grid); 
    
    // 2. Create the moving "window"
    // fract(TIME) makes the clump loop across the bar
    float moving_window = fract(TIME * speed);
    
    // 3. Define the clump area
    // This mask is what "activates" the boxes as it passes over them
    float clump_width = 0.1; // Adjust this to make the 3-box group wider/narrower
    float mask = smoothstep(moving_window - clump_width, moving_window, UV.x) - 
                 smoothstep(moving_window, moving_window + clump_width, UV.x);
    
    // 4. Combine them
    float final_visibility = mask * boxes;
    
    // 5. Final Color output
    vec3 final_rgb = mix(bg_color.rgb, block_color.rgb, final_visibility);
    
    // OPTIONAL: Add a tiny bit of "glow" around the boxes
    final_rgb += block_color.rgb * mask * 0.2;
    
    COLOR = vec4(final_rgb, 1.0);
}