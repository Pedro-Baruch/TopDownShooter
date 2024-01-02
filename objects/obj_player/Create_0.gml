/// @description Insert description here
// You can write your code in this editor

// Definindo a velocidade do player
player_vel = 5

// Criando método para movimentação
/// @method Definindo movimentação do player. _player_vel = velocidade do player
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

shooting = function(){
	// Pegando a direçao do player em relação ao mouse e fazendo ele olhar
	var _direction = point_direction(x,y,mouse_x, mouse_y)
	image_angle = _direction
}


















