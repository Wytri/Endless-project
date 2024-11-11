shader_type canvas_item;

// Colores de degradado
uniform vec4 top_sky_color = vec4(0.3, 0.6, 1.0, 1.0);     // Cielo superior
uniform vec4 horizon_color = vec4(0.6, 0.8, 1.0, 1.0);     // Horizonte (zona de transición)
uniform vec4 bottom_ocean_color = vec4(0.1, 0.4, 0.7, 1.0); // Mar

void fragment() {
    float y = UV.y;

    // Transición suave de colores: desde el cielo (parte superior) hasta el mar (parte inferior)
    vec4 color;
    if (y < 0.3) {
        // Cielo superior a horizonte
        color = mix(top_sky_color, horizon_color, y / 0.3);
    } else if (y < 0.7) {
        // Horizonte a transición hacia el mar
        color = mix(horizon_color, bottom_ocean_color, (y - 0.3) / 0.4);
    } else {
        // Mar en la parte inferior
        color = bottom_ocean_color;
    }
    
    COLOR = color;
}