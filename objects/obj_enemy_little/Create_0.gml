/// @description Insert description here
// You can write your code in this editor

// Criando variáveis para um timer
enemy_direction_timer = 60 * 6
enemy_direction_counter = enemy_direction_timer

// Métodos
/// @method Define movimento dos inimigos pequenos
enemy_movement = function(){
	// Fazendo nascer com velocidade aleatória
	speed = irandom_range(1,4)

	// Fazendo nascer olhando pra uma direção aleatória
	enemy_look(irandom_range(0,360))
}

/// @method Recebe uma direção e faz o inimigo olhar pra ela
enemy_look = function(_direction){
	direction = _direction
	image_angle = direction // Fazendo ele olhar pra direção que nasceu
}

/// @method Fazer com que o inimigo não saia da room, nessa casa ele parece quicar nas bordas da room
enemy_prevent_outside = function(){	
	if(x > room_width || x < 0){
		hspeed *= -1
	}
	if(y > room_height || y < 0){
		vspeed *= -1
	}
	
	enemy_look(direction)
}

/// @method Faz o inimigo mudar de direção
enemy_change_direction = function(){
	if(enemy_direction_counter > 0){
		enemy_direction_counter --
	}else{
		enemy_look(irandom_range(0,360))
		// Resetando o timer
		enemy_direction_counter = enemy_direction_timer
	}
}

// Chamando método
enemy_movement()

















