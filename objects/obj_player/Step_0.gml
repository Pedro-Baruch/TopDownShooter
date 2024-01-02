/// @description Insert description here
// You can write your code in this editor

// Chamando a função de movimentação do player
player_movement(player_vel)

// Fazendo o player atirar
shooting(shoot_vel)

// Rodando contador para pode atirar novamente
if(shoot_timer_counter >= 0){
	shoot_timer_counter --
}

// Fazendo a animação mudar antes de poder atirar novamente
if(shoot_timer_counter == shoot_timer/2){
	sprite_index = spr_player
}












