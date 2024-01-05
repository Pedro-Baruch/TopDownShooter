/// @description Insert description here
// You can write your code in this editor

/// @method Define o movimento do chunk quando o inimigo morrer
enemy_chunk_movement = function(){
	// Fazendo nascer com velocidade aleatória
	speed = irandom_range(4,5)

	// Fazendo nascer olhando pra uma direção aleatória
	enemy_chunk_look(irandom_range(0,360))
}

// @method Fazer eles olharem pra direção que estão indo
enemy_chunk_look = function(_direction){
	direction = _direction
	image_angle = direction // Fazendo ele olhar pra direção que nasceu
}

// @method Fazer ele perder velocidade com o tempo até fica iguala 0
enemy_loses_velocity = function(){
	if(speed > 0){ 
		speed -= 0.2
	}
}

// @method Fazer ficar transparente e depois se destruir
enemy_chunk_destroy = function(){
	if(speed <= 0){
		image_alpha -= 0.01
		
		if(image_alpha <= 0){
			instance_destroy()
		}
	}
}

// Chamando o metodo de movimento
enemy_chunk_movement()






















