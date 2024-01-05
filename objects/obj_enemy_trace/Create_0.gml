/// @description Insert description here
// You can write your code in this editor

// Criando grande para dar efeito de impacto
image_xscale = 3
image_yscale = image_xscale

// Métodos
/// @method Fazendo ficar transparente antes de destruir o objeto
trace_transparency_effect = function(){
	image_alpha -= 0.01

	if(image_alpha <= 0){
		instance_destroy()
	}
}

/// @method Fazendo o trace voltar ao tamanho original
trace_size_effect = function(){
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = image_xscale
}























