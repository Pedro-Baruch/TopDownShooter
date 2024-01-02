/// @description Insert description here
// You can write your code in this editor

// Definindo nome das variaveis para efeito de brilho do tiro
shot_shine_alpha = 0
shot_shine_color = c_white 

// Criando tiro o dobro maior
image_xscale = 2
image_yscale = image_xscale

// Criando timer para destruir o tiro após 6 segundos
shot_destroy_timer_counter = 60 * 6

// Métodos
shot_shine_effect = function(){	
	// Me desenhando
	draw_self()

	//Fazendo efeito no tiro do player
	gpu_set_blendmode(bm_add)

	draw_sprite_ext(spr_shot_effect, image_index, x,y, image_xscale * 1.5, image_yscale *1.5, image_angle, shot_shine_color,shot_shine_alpha)

	gpu_set_blendmode(bm_normal)
}

shot_size_effect = function(){
	// Fazendo tiro diminuir com o tempo
	image_xscale = lerp(image_xscale,1,0.3)
	image_yscale = image_xscale
}

shot_destroy_timer = function(){
	if(shot_destroy_timer_counter > 0){
		shot_destroy_timer_counter --
	}else{
		instance_destroy()
	}
}













