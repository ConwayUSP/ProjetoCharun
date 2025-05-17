extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _on_body_entered(_body: Node2D) -> void:
	# Verifica se não está já ativo
	if animation_player.current_animation != "pickup":
		# Toca o som
		if AudioManager.powerUp != null:
			AudioManager.powerUp.play()
		
		# Ativa a imunidade
		GameManager.add_imunity()
		
		# Esconde o power-up
		animation_player.play("pickup")
		collision_shape.set_deferred("disabled", true)
		
		# Cria um timer confiável
		var timer = get_tree().create_timer(10.0)
		timer.timeout.connect(_remove_power_up)

func _remove_power_up():
	# Remove a imunidade
	GameManager.remove_imunity()
	
