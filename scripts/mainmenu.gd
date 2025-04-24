extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for _button in get_tree().get_nodes_in_group("buttons_menu"):
		_button.pressed.connect(_on_button_pressed.bind(_button))
	 
func _on_button_pressed(button: Button) -> void:
	match button.name:
		"Novojogo":
			var _jogo: bool = get_tree().change_scene_to_file("res://scenes/game.tscn")
		"Continuar":
			var _jogo: bool = get_tree().change_scene_to_file("res://scenes/game.tscn")
		"Config":
			var _jogo: bool = get_tree().change_scene_to_file("res://scenes/jogo.tscn")
		"Creditos":
			var _creditos: bool = get_tree().change_scene_to_file("res://scenes/jogo.tscn")
		"Sair":
			get_tree().quit()
