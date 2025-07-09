extends Node





func _on_reset_button_pressed() -> void:
	GameManager.life = 100
	GameManager.score = 0
	GameManager.cronometro = 0
	GameManager.player.global_position.x = -23.0
	GameManager.player.global_position.y = 1.0
	GameManager.salvar()
	get_tree().reload_current_scene()




func _on_quit_button_pressed() -> void:
	get_tree().quit()
