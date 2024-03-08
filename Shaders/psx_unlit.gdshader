//*** *** *** *** *** *** *** *** *** *** *** *** ***//
//*** ===   PSX unlit surface shader effect   === ***//
//*** ===           For Godot 4.x             === ***//
//*** ===         By Analog Feelings          === ***//
//*** ===  https://github.com/AnalogFeelings  === ***//
//*** *** *** *** *** *** *** *** *** *** *** *** ***//
//*** ===        Licensed under the:          === ***//
//*** ===            MIT License              === ***//
//*** *** *** *** *** *** *** *** *** *** *** *** ***//
//*** ===     Derived from CC0 work by:       === ***//
//*** ===            Mighty Duke              === ***//
//*** *** *** *** *** *** *** *** *** *** *** *** ***//

/*****************************************************************************
MIT License

Copyright (c) 2022 Analog Feelings

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*****************************************************************************/

shader_type spatial;
render_mode unshaded, skip_vertex_transform, diffuse_lambert_wrap;

uniform sampler2D albedo: hint_default_black, filter_nearest;
uniform sampler2D emission: hint_default_black, filter_nearest;

// The "jumpiness" of vertices.
uniform float jitter: hint_range(0.0, 1.0) = 0.5;

// If disabled, jitter will not affect the Z coordinate
// of the vertex.
uniform bool jitter_z_coordinate = true;

// If disabled, makes vertices further away from the camera
// less jittery.
uniform bool jitter_depth_independent = true;

// Enables the PS1 texture warping.
uniform bool affine_texture_mapping = true;

// Any alpha value below this will not be rendered.
uniform float alpha_scissor: hint_range(0.0, 1.0) = 1.0;

// Color to overlay on top of the albedo texture.
uniform vec4 albedo_color: source_color = vec4(1.0);

// Emission color.
uniform vec4 emission_color: source_color = vec4(1.0);

// Texture tiling.
uniform vec2 texture_size = vec2(1.0);

void vertex() {
	VERTEX = (MODELVIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	
	float z_orig = VERTEX.z;
	float i = (1.0 - jitter) * min(VIEWPORT_SIZE.x, VIEWPORT_SIZE.y) / 2.0;
	
	if (jitter_depth_independent) {
		float w = (PROJECTION_MATRIX * vec4(VERTEX, 1.0)).w;
		VERTEX = round(VERTEX / w * i) / i * w;
	} else {
		VERTEX = round(VERTEX * i) / i;
	}
	
	if (!jitter_z_coordinate) {
		VERTEX.z = z_orig;
	}

	if (affine_texture_mapping) {
		UV *= VERTEX.z;
	}
}

void fragment() {
	vec2 uv = UV;
	
	if (affine_texture_mapping) {
		uv /= VERTEX.z;
	}
	
	uv /= texture_size;
	
	// Overlay albedo color with the albedo texture.
	ALBEDO = albedo_color.rgb * texture(albedo, uv).rgb;
	
	ALPHA = texture(albedo, uv).a;
	ALPHA_SCISSOR_THRESHOLD = alpha_scissor;
	
	EMISSION = emission_color.rgb * texture(emission, uv).rgb;
}
