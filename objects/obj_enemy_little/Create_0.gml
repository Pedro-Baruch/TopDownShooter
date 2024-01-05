/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Intervalo velocidade
velocity01 = 3
velocity02 = 5

// Vida do inimigo
enemy_life = 2

// Criando a distancia minima para o inimigo te ver e perseguir
minimal_distance = 200

// Definindo quantos pedaços vai dropar
chunk01 = 3
chunk02 = 5

/// @method Faz o inimigo seguir o player quando ele chegar muito perto
enemy_region_seek = function(){
	if(instance_exists(obj_player)){
		var _distance = point_distance(x,y,obj_player.x, obj_player.y)
		
		if(_distance <= minimal_distance){
			var _direction = point_direction(x,y,obj_player.x, obj_player.y)
			enemy_look(_direction)
		}
	}
}

enemy_movement(velocity01,velocity02)
