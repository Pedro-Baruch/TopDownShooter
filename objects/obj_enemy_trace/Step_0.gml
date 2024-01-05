/// @description Insert description here
// You can write your code in this editor

image_alpha -= 0.01

if(image_alpha <= 0){
	instance_destroy()
}

image_xscale = lerp(image_xscale,1.5,0.1)
image_yscale = image_xscale