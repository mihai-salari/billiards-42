#ifdef GL_ES
precision mediump float;
#endif

varying vec2 v_texCoord;
uniform sampler2D u_texture;
uniform float u_time;

void main()
{
    vec4 normalColor = texture2D(u_texture, v_texCoord).rgba;
    vec3 normalColor3 = texture2D(u_texture, v_texCoord).rgb;
    
    float intensivity = 1.0;
    
    if ( length( normalColor3 ) > 0.5 ) {
    
        vec2 direction = vec2( 1.0, 0.1);
    
        float time_offset = u_time * 0.75;
        float pos = dot( v_texCoord, direction ) * 10.0 - time_offset;
        float target_pos = 5.0;
        float i1 = pow ( cos( pos - target_pos ), 40.0 );
        float i2 = i1 * step( 0.0, i1 );
        intensivity = i2 + 1.0;
    }
    
    gl_FragColor = normalColor * intensivity;
}