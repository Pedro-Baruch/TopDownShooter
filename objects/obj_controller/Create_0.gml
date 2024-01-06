/// @description Insert description here
// You can write your code in this editor

// Contador para gerar de 2 em 2 segundos
timer = 5
controller_counter = 0
controller_timer = 60 * timer

global.level = 1
level_aux = global.level

// Pontos do player
global.player_points = 0

global.player_life = 5

// Gerar inimigos de forma aleatória porem fora da tela do player
enemy_generator = function(){
	var _place_x = irandom_range(100,room_width - 100)
	var _place_y = irandom_range(100,room_height- 100)
	
	if(controller_counter <= 0){
		if(instance_exists(obj_player)){
			var _enemy = instance_create_layer(_place_x,_place_y,layer,obj_enemy_big)
			
			var _distance_player_enemy = point_distance(_enemy.x,_enemy.y,obj_player.x,obj_player.y)
			
			if(_distance_player_enemy <= 896){
				instance_destroy(_enemy, false)
				controller_counter = 0
			}else{
				controller_counter = controller_timer
			}
		}
	}
}

// Fazer criar o player em uma posição qualquer da room
player_generator = function(){
	var _place_x = irandom_range(100,room_width - 100)
	var _place_y = irandom_range(100,room_height- 100)
	
	if(!instance_exists(obj_player)){
		instance_create_layer(_place_x,_place_y,"Player",obj_player)
	}
}

// Criar o objeto screeshake
screeshake_generator = function(){
	if(!instance_exists(obj_screenshake)){
		instance_create_layer(0,0,"Screenshake",obj_screenshake)
	}
}

// Aumentar nivel
increase_difficult = function(){
	if(timer >= 2){
		if(global.player_points >= 100 * global.level){
			// Reiniciando a room sempre que subir de level
			timer -= 0.2
			global.level++
			room_restart()
			
			// Alterandoo o tamanho da room sempre que reiniciar a room
			room_width = irandom_range(3000,5000)
			room_height = irandom_range(3000,5000)
		}
	}
}

change_background = function(){
	var _bg = choose(spr_background01, spr_background02, spr_background03)
	var _lay_id = layer_get_id("Background")
	var _back_bg = layer_background_get_id(_lay_id)
	layer_background_sprite(_back_bg, _bg)
}