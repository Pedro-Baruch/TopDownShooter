/// @description Insert description here
// You can write your code in this editor

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
	if(x > 3800 || x < 0){
		direction += 90
	}
	if(y > 2600 || y < 0){
		direction +=90
	}
	
	enemy_look(direction)
}

// Chamando método
enemy_movement()

















