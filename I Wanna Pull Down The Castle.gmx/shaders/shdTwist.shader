//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float radius;
uniform float angle;
uniform vec2 offset;
uniform vec4 filterArea;

vec2 mapCoord(vec2 coord)
{
    coord *= filterArea.xy;
    coord += filterArea.zw;

    return coord;
}

vec2 unmapCoord(vec2 coord)
{
    coord -= filterArea.zw;
    coord /= filterArea.xy;
    
    return coord;
}

vec2 twist(vec2 coord)
{
    coord -= offset;
    
    float dist = length(coord);
    
    if (dist < radius)
    {
        float ratioDist = (radius - dist) / radius;
        float angleMod = ratioDist * ratioDist * angle;
        float s1 = sin(angleMod);
        float c = cos(angleMod);
        coord = vec2(coord.x * c - coord.y * s1, coord.x * s1 + coord.y * c);
    }
    
    coord += offset;
    
    return coord;
}

void main()
{
    vec2 coord = mapCoord(v_vTexcoord);
    
    coord = twist(coord);
    
    coord = unmapCoord(coord);
    
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, coord );
}

