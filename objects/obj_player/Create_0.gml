/// @description Insert description here
// You can write your code in this editor

// Definindo a velocidade do player
player_vel = 5

// Velocidade do tiro do player
shoot_vel = 20

// Criando um timer para o tiro
player_shoot_timer_counter = 0
player_shoot_timer = 30 

// Definindo tempo de imunidade do player
player_immunity_timer = 60 * 3
player_immunity_counter = 1

// Definindo alpha da imagem para ter efeito de piscar 
player_alpha_value = 0.05

// Criando método para movimentação
/// @method Definindo movimentação do player, recebe algum valor que define a velocidade do player
player_movement = function(_player_vel){	
	// Detectando as teclas para o movimento
	var _key_w = keyboard_check(ord("W"))
	var _key_a = keyboard_check(ord("A"))
	var _key_s = keyboard_check(ord("S"))
	var _key_d = keyboard_check(ord("D"))

	// Fazendo o player se mover
	var _vel_v = 0
	var _vel_h = 0

	_vel_v += (_key_s - _key_w) * _player_vel
	_vel_h += (_key_d - _key_a) * _player_vel
	
	x+= _vel_h
	y+= _vel_v
	
	// Fazendo o player não se mover mais rapido na horizontal
	var _total_speed = point_distance(0,0,_vel_h,_vel_v) // Usando o point distance para verificar a velocidade total do player
	if(_total_speed > _player_vel){
		_vel_h *= _player_vel / _total_speed	
		_vel_v *= _player_vel / _total_speed	
	}

	// Fazendo animação ocorrer apenas se o player está se movendo
	if(_vel_v == 0 && _vel_h == 0){
		image_speed = 0
		image_index = 1
	}else{
		image_speed = 1
	}
}

/// @method Definindo com o tiro deve se comportar, recebe algum valor para definir a velocidade do tiro
player_shooting = function(_vel_shoot){
	// Pegando a direçao do player em relação ao mouse e fazendo ele olhar
	var _direction = point_direction(x,y,mouse_x, mouse_y)
	image_angle = _direction
	
	// Rodando contador para pode atirar novamente
	if(player_shoot_timer_counter >= 0){
		player_shoot_timer_counter --
	}

	// Fazendo a animação mudar antes de poder atirar novamente
	if(player_shoot_timer_counter == player_shoot_timer/2){
		sprite_index = spr_player
	}
	
	// Verificando se o player apertou o botão esquerdo do mouse
	var _key_mbleft = mouse_check_button(mb_left)
	
	if(_key_mbleft && player_shoot_timer_counter <= 0){
		// Caso atire troca para a sprite de tiro
		sprite_index = spr_player_shoot
		
		// Criando o tiro que vai na direçãod o mouse
		var _shoot = instance_create_layer(x,y,layer,obj_shot)
		_shoot.speed = _vel_shoot
		_shoot.direction = point_direction(x,y, mouse_x, mouse_y)
		
		// Definindo efeito do tiro
		_shoot.shot_shine_alpha = 0.9
		_shoot.shot_shine_color = c_yellow
		
		// Utilizando nosso contador para limitar os tiros
		player_shoot_timer_counter = player_shoot_timer
	}
}

/// @method Verifica se tem algum inimigo colidindo com o player e se tiver o playe recebe dano
player_damage = function(){
	var _enemy = instance_place(x,y,obj_enemy_father)
	
	player_blink_effect()
	
	if(_enemy && player_immunity_counter <= 0){
		global.player_life -= _enemy.damage
		
		// Resetando contador
		player_immunity_counter = player_immunity_timer
	
		
		if(global.player_life <= 0){
			instance_destroy()
			
			room_restart()
		}
	}
}

// @method Fazer efeito de piscar após player tomar dano e continuar durante o tempo de invencibilidade
player_blink_effect = function(){
	if(player_immunity_counter > 0){
		image_alpha += player_alpha_value
		if( image_alpha >= 1 || image_alpha <= 0) player_alpha_value *= -1
	}else if(player_immunity_counter <= 0){
		image_alpha = 1
	}
}

// Aumentar pontos do player
player_gain_points = function(_points){
	global.player_points += _points
	show_debug_message(global.player_points)
}

















