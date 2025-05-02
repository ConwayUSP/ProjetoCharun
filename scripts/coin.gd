extends Area2D  

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	print("Pegou moeda")
	if animation_player.current_animation != "pickup":
		GameManager.add_point()
		if AudioManager.coletarMoeda != null:
			AudioManager.coletarMoeda.play()  
		animation_player.play("pickup")
