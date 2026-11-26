
shader_type spatial;

uniform sampler2D textura_piso : source_color;
uniform sampler2D textura_paredes : source_color;

uniform float limite_piso = 0.8;
uniform float escala_piso = 2.0;
uniform float escala_paredes = 2.0;

void fragment() {
    vec3 normal = normalize(NORMAL);

    if (normal.y > limite_piso) {
        ALBEDO = texture(
            textura_piso,
            UV * escala_piso
        ).rgb;
    } else {
        ALBEDO = texture(
            textura_paredes,
            UV * escala_paredes
        ).rgb;
    }
}
