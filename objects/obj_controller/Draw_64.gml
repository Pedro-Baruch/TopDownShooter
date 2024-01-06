/// @description Insert description here
// You can write your code in this editor
draw_text(20,20,"Vidas: " + string(global.player_life))
draw_text(20,40,"Level: " + string(global.level))

//Apontando par ao inimigo grande
if(instance_exists(obj_enemy_big) && instance_exists(obj_player)){
	with(obj_player){
		var _enemy_near = instance_nearest(x,y,obj_enemy_big)
		
		var _dir = point_direction(x,y, _enemy_near.x, _enemy_near.y)
		
		draw_sprite_ext(spr_arrow,0,1280/2, 100, 1,1,_dir,c_white,1)
	}
}
























