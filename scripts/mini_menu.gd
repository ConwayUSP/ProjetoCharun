extends Node

@onready var resume_butt = $menu_holder/resume_button

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	
	
	
func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")


func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	resume_butt.grab_focus()
	
func test_esc():
	if Input.is_action_just_pressed("menu") and get_tree().paused == false:
		pause()
		
	elif Input.is_action_just_pressed("menu") and get_tree().paused == true:
		resume()
		

func _on_reset_button_pressed() -> void:
	GameManager.life = 100
	GameManager.score = 0
	GameManager.cronometro = 0
	GameManager.player.global_position.x = -23.0
	GameManager.player.global_position.y = 1.0
	GameManager.salvar()
	get_tree().paused = false
	get_tree().reload_current_scene()
	

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_resume_button_pressed() -> void:
	resume()
	



func _on_last_checkpoint_button_pressed() -> void:
	GameManager.carregar()
	resume()


func _process(delta: float) -> void:
	test_esc()
