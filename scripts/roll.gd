extends Area2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	if animation_player.current_animation != "pickup":
		if AudioManager.powerUp != null:
			AudioManager.powerUp.play()
		GameManager.add_imunity()
		animation_player.play("pickup")
		await get_tree().create_timer(10.0).timeout
		GameManager.remove_imunity()
