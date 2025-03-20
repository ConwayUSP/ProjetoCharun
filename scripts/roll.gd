extends Area2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var powerUp: AudioStreamPlayer2D = $powerUp_som

func _on_body_entered(_body: Node2D) -> void:
	if animation_player.current_animation != "pickup":
		if powerUp != null:
			powerUp.play()
		GameManager.add_imunity()
		animation_player.play("pickup")
