/// @description Insert description here
// You can write your code in this editor

enemy_explodes_chunk()

instance_create_layer(x,y,layer,obj_enemy_trace)

if(instance_exists(obj_player)){
	obj_player.player_gain_points(10)
}


















