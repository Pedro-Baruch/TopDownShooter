/// @description Insert description here
// You can write your code in this editor

global.shake = 0

/// @method Função para fazer o efeito de tremer a tela quando a variavel global.shake for maior que 0
screenshake_call = function(){
	view_xport[0] = random_range(-global.shake,global.shake)
	view_yport[0] = random_range(-global.shake,global.shake)
	
	if(global.shake> 0){
		global.shake *= .9
		
		if(global.shake <= 0.1) global.shake = 0
	}
}






















