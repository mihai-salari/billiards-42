#ifdef GL_ES
precision mediump float;
#endif

varying vec2 v_texCoord;
uniform sampler2D u_texture;
uniform vec2 u_direction;
uniform float u_time;

void main()
{
    vec4 normalColor = texture2D(u_texture, v_texCoord).rgba;
    
    vec2 direction = vec2( -1.0, 0.0);
    
    if( length( u_direction ) != 0.0 ) {
        direction = u_direction / length( u_direction );
    }
    
    
    //direction = vec2( 1.0, 1.0);
    //float time_offset = u_time * 0.75;
    float world_offset =  dot( direction, vec2( gl_FragCoord.x , gl_FragCoord.y )  ) * 0.050;
    float pos = /* length( v_texCoord ) */ world_offset;
    float i1 = sin( pos );
    float i2 = i1 * step( 0.0, i1 );
    float intensivity = i2*0.25 + 1.75;
    
    vec4 tint = vec4( 0.32, 0.73, 0.89, 1.0);// * ( abs( sin( u_time ) ) + 1.0 ); // self-illumination
    //vec4 tint = vec4( 0.89, 0.3, 0.32, 1.0);// * ( abs( sin( u_time ) ) + 1.0 ); // self-illumination allow us to change ball color!!!
    vec4 col1 =  vec4(normalColor.r * intensivity, normalColor.g * intensivity , normalColor.b * intensivity , normalColor.w);
    

    gl_FragColor = col1*tint;
}