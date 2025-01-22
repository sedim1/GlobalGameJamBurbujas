extends Control

@onready var menu: Control = $MenuPrincipal 
@onready var main_game := $MainGame 
@onready var instancia_nivel
@onready var seleccion_niveles := $SeleccionNiveles

func _ready():# se llama al principio
	menu.show()
	seleccion_niveles.hide()

func unload_level():
	# Esta func se asegura que cuando se va a cargar un nivel, se elimine el actual
	if (is_instance_valid(instancia_nivel)):
		instancia_nivel.queue_free()
	instancia_nivel = null
	

func load_level(nombre_nivel : String):
	# Esta func recibe el nivel adecuado a cargar, elimina el anterior, y carga el nuevo
	# Los niveles se tienen que guardar en la carpeta niveles!!!
	seleccion_niveles.hide()
	unload_level()
	var dir_nivel := "res://niveles/%s.tscn" %nombre_nivel 
	var nivel_actual = load(dir_nivel).instantiate()
	instancia_nivel = nivel_actual
	main_game.add_child(nivel_actual)


# FUNCIONES DEL MANEJO DE BOTONES EN MENUS
func _on_nivel_1_pressed():
	load_level("test_level_1")

func _on_nivel_2_pressed():
	load_level("test_level_2") 

func _on_nivel_3_pressed():
	load_level("test_level_3")

func _on_salir_pressed():
	get_tree().quit()

func _on_elegir_nivel_pressed():
	menu.hide()
	seleccion_niveles.show()
