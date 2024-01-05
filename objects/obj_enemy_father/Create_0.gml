/// @description Insert description here
// You can write your code in this editor

// Criando variáveis para um timer
enemy_direction_timer = 60 * 6
enemy_direction_counter = enemy_direction_timer

// Vida do inimigo
enemy_life = 2

// Definindo quantos pedaços vai cair
chunk01 = 0
chunk02 = 0

// Dano do inimigo
damage = 1

// Métodos
/// @method Define movimento dos inimigos pequenos, _velocity01, _velocity02 são os intervalos entre as velocidade que o inimigo pode receber
enemy_movement = function(_velocity01, _velocity02){
	// Fazendo nascer com velocidade aleatória
	speed = irandom_range(_velocity01,_velocity02)

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

/// @method Tira um de vida do inimigo quando chamada e se não tiver vida o inimigo se destroi, Recebe um valor do dano _damage: number
enemy_damage = function(_damage){
	// Garantir que se não passar valor pro dano ele vai valer 1
	if(_damage == undefined){
		_damage = 1
	}
	
	enemy_life -=_damage
	
	if(enemy_life <= 0){
		instance_destroy()
	}
	
	// Fazendo tremer fraco quando tomar tiro
	global.shake = 2
}

/// @method Fazer o inimigo explodir em varios pedaços ao morrer
enemy_explodes_chunk = function(){
	var _repeater = irandom_range(chunk01,chunk02)
	repeat(_repeater){
		var _chunk = instance_create_layer(x,y,layer,obj_enemy_chunk)
	}
	
	// Fazendo tremer forte quando o inimigo morrer
	global.shake = 10
} 






















