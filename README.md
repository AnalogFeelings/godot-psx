# :tv: GodotPSX

![GitHub repo size](https://img.shields.io/github/repo-size/AnalogFeelings/godot-psx?style=flat-square&logo=github&label=Repo%20Size)
[![GitHub issues](https://img.shields.io/github/issues/analogfeelings/godot-psx?style=flat-square&logo=github&label=Issues)](https://github.com/AnalogFeelings/godot-psx/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/analogfeelings/godot-psx?label=Pull%20Requests&style=flat-square&logo=github)](https://github.com/AnalogFeelings/godot-psx/pulls)
[![GitHub](https://img.shields.io/github/license/analogfeelings/godot-psx?label=License&style=flat-square&logo=opensourceinitiative&logoColor=white)](https://github.com/AnalogFeelings/godot-psx/blob/master/LICENSE)
[![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/m/analogfeelings/godot-psx/master?label=Commit%20Activity&style=flat-square&logo=github)](https://github.com/AnalogFeelings/godot-psx/graphs/commit-activity)
[![GitHub Repo stars](https://img.shields.io/github/stars/analogfeelings/godot-psx?label=Stargazers&style=flat-square&logo=github)](https://github.com/AnalogFeelings/godot-psx/stargazers)
[![Mastodon Follow](https://img.shields.io/mastodon/follow/109309123442839534?domain=https%3A%2F%2Ftech.lgbt%2F&style=flat-square&logo=mastodon&logoColor=white&label=Follow%20Me!&color=6364ff)](https://tech.lgbt/@analog_feelings)

A small pack of shaders to replicate that old PS1 look in Godot 4.0.  
They may also work on Godot 3.x, but they haven't been tested. Proceed with caution!

> [!WARNING]  
> Gouraud shading is currently broken in Godot 4.x, so use 3.x or wait until 4.4 releases if you need it.  
> Progress on the pull request can be tracked at [godotengine/godot#83360](https://github.com/godotengine/godot/pull/83360).

## :wave: Attributions

Lit and unlit shaders are based on work by **Mighty Duke**, which is licensed under the CC0 license.  
Dithering shader is based on work by the **Duckstation** emulator team.

Dithering shader is based on: https://github.com/stenzek/duckstation/blob/master/src/core/gpu_hw_shadergen.cpp  
Lit and unlit shaders are based on: https://godotshaders.com/shader/ps1-shader/

Thanks to the [HauntedPS1](https://twitter.com/hauntedps1) community for inspiration and help with the Fade shader quantization.

## :thinking: Usage

Refer to [this](USAGE.md) document for instructions.  
Of course, you'll require a basic understanding on importing and using shaders.

# :framed_picture: Screenshots

![normal](./Screenshots/normal.png)  
![fade to white](./Screenshots/fadetowhite.png)
![fade to black](./Screenshots/fadetoblack.png) 

# :balance_scale: License

These shaders are licensed under the [MIT License](LICENSE).  
This license allows you to use these shaders in your game, even if its closed-source software, as long as you keep the license and copyright notices
for these shaders.

> [!WARNING]  
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
