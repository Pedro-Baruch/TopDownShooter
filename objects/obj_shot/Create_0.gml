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
/// @method Faz um brilho para o tiro, as variaveis de cor e intensidade podem ser definidas dentro do objeto
shot_shine_effect = function(){	
	// Me desenhando
	draw_self()

	//Fazendo efeito no tiro do player
	gpu_set_blendmode(bm_add)

	draw_sprite_ext(spr_shot_effect, image_index, x,y, image_xscale * 1.5, image_yscale *1.5, image_angle, shot_shine_color,shot_shine_alpha)

	gpu_set_blendmode(bm_normal)
}

/// @method Faz o tiro diminuir de tamanho gradualmente
shot_size_effect = function(){
	// Fazendo tiro diminuir com o tempo
	image_xscale = lerp(image_xscale,1,0.3)
	image_yscale = image_xscale
}

/// @method Timer para o tiro se destruir depois de 6 segundos sem acertar nada
shot_destroy_timer = function(){
	if(shot_destroy_timer_counter > 0){
		shot_destroy_timer_counter --
	}else{
		instance_destroy()
	}
}

/// @method Dar dano no inimigo little
shot_damage_enemy_little = function(_damage){
	// Veririficando colisão com o inimigo
	var _enemy = instance_place(x,y, obj_enemy_father)
	
	if(_enemy){
		_enemy.enemy_damage()
		instance_destroy()
		
		instance_create_layer(x,y,layer,obj_shot_explosion)
	}
}










