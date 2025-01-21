extends Control

@onready var menu : Control = $MenuPrincipal 
@onready var main_game := $MainGame 
@onready var instancia_nivel
@onready var niveles = $SeleccionNiveles

func _ready():# se llama al principio
	pass 

func unload_level():
	# Esta func se asegura que cuando se va a cargar un nivel, se elimine el actual
	if (is_instance_valid(instancia_nivel)):
		instancia_nivel.queue_free()
	instancia_nivel = null
	

func load_level(nombre_nivel : String):
	# Esta func recibe el nivel adecuado a cargar, elimina el anterior, y carga el nuevo
	# Los niveles se tienen que guardar en la carpeta niveles!!!
	niveles.hide()
	unload_level()
	var dir_nivel := "res://niveles/%s.tscn" %nombre_nivel 
	var nivel_actual = load(dir_nivel).instantiate()
	instancia_nivel = nivel_actual
	main_game.add_child(nivel_actual)


func _on_nivel_1_pressed():
	load_level("nivelchido")


func _on_nivel_2_pressed():
	load_level("test_level_2") 


func _on_nivel_3_pressed():
	load_level("test_level_3")
