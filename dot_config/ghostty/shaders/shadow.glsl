#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D iChannel0; // Terminal texture
uniform vec2 iResolution;    // Screen resolution
uniform float iTime;         // Time (if needed)

// Drop shadow settings:
const vec2 kShadowOffset = vec2(2.0, 2.0); // in pixels
const float kShadowOpacity = 0.6;          // shadow opacity
const vec3 kShadowColor = vec3(0.0, 0.0, 0.0); // black

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution;
    
    // Sample original terminal texture
    vec4 orig = texture2D(iChannel0, uv);
    
    // Get an offset sample for shadow
    vec2 offset = kShadowOffset / iResolution;
    vec4 sampleShadow = texture2D(iChannel0, uv + offset);
    
    // Compute drop shadow: use the shadow sample alpha as mask
    vec3 shadow = kShadowColor * sampleShadow.a * kShadowOpacity;
    
    // If original pixel is very bright, blend shadow more
    float brightness = dot(orig.rgb, vec3(0.2126, 0.7152, 0.0722));
    // For low brightness, assume there's text; apply shadow below
    vec3 composite = mix(shadow, orig.rgb, orig.a);
    
    // To ensure overall opacity is non-zero (for transparent backgrounds), force a minimum alpha
    float alpha = max(orig.a, 0.95);
    
    fragColor = vec4(composite, alpha);
}

void main() {
    mainImage(gl_FragColor, gl_FragCoord.xy);
}
