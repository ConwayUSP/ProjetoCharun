extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _on_body_entered(_body: Node2D) -> void:
	# Evita retriggar se já está sendo coletado
	if animation_player.current_animation == "pickup":
		return
	# Toca som e ativa imunidade
	if AudioManager.powerUp != null:
		AudioManager.powerUp.play()
	GameManager.add_immunity(25.0)  # 25 segundos de imunidade
	# Toca animação de coleta e desativa colisão
	animation_player.play("pickup")
	collision_shape.set_deferred("disabled", true)
	
