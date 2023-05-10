# Usage Instructions
Here are some usage instructions for this shader pack. If you have any extra questions (which I doubt), you can find me in the HauntedPS1 Discord server as
the user with the name "Analog Feelings".

## For Lit/Unlit shader
Apply the shader as a material override for any mesh instance.  
You can then tweak the parameters by opening the "Shader Parameters" dropdown menu.

![image](https://user-images.githubusercontent.com/51166756/201706584-c3e9c615-60d2-4598-bf30-0fdf68b8b751.png)

## For Dithering shader
Apply it as a shader material to a viewport container with a viewport as a child. Make sure that the scene's camera is a child of the viewport, or a child of a child of the viewport.

![image](https://user-images.githubusercontent.com/51166756/201707608-1fbce9a4-0b7f-408b-9e48-f2435c5470de.png)  
![image](https://user-images.githubusercontent.com/51166756/201707642-d03a8323-08fc-48fa-a4bd-c30bcdf5de84.png)

## For Fade shader
Follow the same procedure as the Dithering shader. Best results if the dithering shader is applied AFTER the fade.  
The `alpha` parameter controls the progress of the fade out/in. A value of 0 means no fade, and a value of 255 means total darkness.

![image](https://user-images.githubusercontent.com/51166756/201707965-f90650e4-5bdf-4f11-99f7-d52b3f7bd661.png)  
![image](https://user-images.githubusercontent.com/51166756/201707994-4134b886-2ec2-4a83-ab52-2d6733eddbba.png)
