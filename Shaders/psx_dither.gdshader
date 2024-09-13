//*** *** *** *** *** *** *** *** *** *** *** *** ***//
//*** ===          PSX dither effect          === ***//
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

shader_type canvas_item;

uniform int color_depth : hint_range(1, 8) = 5;
uniform bool dithering = true;

int max_value_from_bits(int bits) {
	return (1 << bits) - 1;
}

int dithering_pattern(ivec2 fragcoord) {
	const int pattern[] = {
		-4, +0, -3, +1, 
		+2, -2, +3, -1, 
		-3, +1, -4, +0, 
		+3, -1, +2, -2
	};
	
	int x = fragcoord.x % 4;
	int y = fragcoord.y % 4;
	
	return pattern[y * 4 + x];
}

void fragment() {
	ivec2 uv = ivec2(FRAGCOORD.xy);
	vec3 color = texelFetch(TEXTURE, uv, 0).rgb;
	
	// Convert from 0 to 1 to 0 to 255.
	ivec3 intColor = ivec3(color * 255.0f);
	int bitshift = (8 - color_depth);
	int maxColor = max_value_from_bits(color_depth);
		
	// Apply the dithering.
	if (dithering) {
		ivec3 ditherApplied = intColor + ivec3(dithering_pattern(uv));
		intColor = clamp(ditherApplied >> bitshift, 0, maxColor);
	}
	else {
		intColor = clamp(intColor >> bitshift, 0, maxColor);
	}
	
	// Convert back to 0 to 1.
	COLOR.rgb = vec3(intColor) / float(maxColor);
}
