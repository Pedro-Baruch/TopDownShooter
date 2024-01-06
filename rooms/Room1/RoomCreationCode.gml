
// Criando o controller caso ele não exista
if(!instance_exists(obj_controller)){
	instance_create_layer(0,0,"Enemy",obj_controller)
}

obj_controller.change_background()