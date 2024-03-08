//*** *** *** *** *** *** *** *** *** *** *** *** ***//
//*** ===          PSX fading effect          === ***//
//*** ===           For Godot 4.x             === ***//
//*** ===         By Analog Feelings          === ***//
//*** ===  https://github.com/AnalogFeelings  === ***//
//*** *** *** *** *** *** *** *** *** *** *** *** ***//
//*** ===        Licensed under the:          === ***//
//*** ===            MIT License              === ***//
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

// 0 = No fade.
// 255 = Totally faded out.
uniform int alpha: hint_range(0, 255);
uniform bool fadeToWhite = false;

void fragment() {
	vec3 color = texelFetch(TEXTURE, ivec2(FRAGCOORD.xy), 0).rgb;
	
	// Convert 0 to 255 to 0 to 1.
	float decimal_alpha = float(alpha) / 255.0;
	
	// Quantize to make it a bit more "jumpy".
	decimal_alpha = floor(decimal_alpha * 32.0) / 32.0;
	
	// Equal to GL_FUNC_REVERSE_SUBTRACT.
	if(!fadeToWhite)
		COLOR.rgb = color - vec3(decimal_alpha);
	else
		COLOR.rgb = color + vec3(decimal_alpha);
}
