/*
 * Original shader from: https://www.shadertoy.com/view/ddKSDd
 */

#ifdef GL_ES
precision lowp float;
#endif

uniform float time;
uniform vec2 resolution;
uniform float r;
uniform float g;
uniform float b;
uniform float offsetY;

#define iTime time
#define iResolution resolution
#define iAnimationColor vec3(r, g, b)


float hash(float n) {
    return fract(sin(n) * 78757.5757 + cos(n) * 71767.8727);
}

// 2D noise function
float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(mix(hash(i.x + hash(i.y)), hash(i.x + 1.0 + hash(i.y)), u.x),
               mix(hash(i.x + hash(i.y + 1.0)), hash(i.x + 1.0 + hash(i.y + 1.0)), u.x), u.y);
}


vec3 auroraLayer(vec2 uv, float speed, float intensity, vec3 color) {
    float t = iTime * speed;
    vec2 scaleXY = vec2(2.0, -2.0);
    vec2 movement = vec2(1.0, 1.0);
    vec2 p = uv * scaleXY + t * movement;
    float n = noise(p + noise(color.xy + p + t + 100.0));
    float aurora = smoothstep(0.1, 0.3, n - uv.y) * (1 - smoothstep(0, 2.5, n - uv.y));

    return aurora * intensity * color;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.y;

    // Correct for aspect ratio
    uv.x *= iResolution.x / iResolution.y;

    uv.y += offsetY;

    vec3 color = vec3(0.0);

    color += auroraLayer(uv, 0.05, 0.3, iAnimationColor);
    color += auroraLayer(uv, 0.1, 0.4, iAnimationColor);
    color += auroraLayer(uv, 0.15, 0.3, iAnimationColor);
    color += auroraLayer(uv, 0.07, 0.2, iAnimationColor);

    fragColor = vec4(color, 1.0);
}

out vec4 outputColor;

void main(void)
{
    mainImage(outputColor, gl_FragCoord.xy);
}