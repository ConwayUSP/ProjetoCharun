extends CanvasLayer
@onready var bt_resume = $menu_holder/bt_resume
func _ready() -> void:
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true;
		bt_resume.grab_focus()

func _on_bt_resume_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_bt_options_pressed() -> void:
	pass # Replace with function body.


func _on_bt_quit_pressed() -> void:
	get_tree().quit()
