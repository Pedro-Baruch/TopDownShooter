/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_life = 4

// Intervalo velocidade
velocity01 = 1
velocity02 = 3

// Definindo quantos pedaços vai dropar
chunk01 = 5
chunk02 = 7

// Fazendo um contador com colocar ovos
lay_eggs_timer = 60 * irandom_range(5,7)
lay_eggs_counter = lay_eggs_timer

// Métodos
/// @method Fazendo o inimigo grande colocar um ovo de tempos em tempos
enemy_lay_eggs = function(){
	if(lay_eggs_counter > 0){
		lay_eggs_counter --
	}else{
		instance_create_layer(x,y,layer,obj_enemy_egg)
		
		// Resetando contador
		lay_eggs_counter = lay_eggs_timer
	}
}


enemy_movement(velocity01,velocity02)

