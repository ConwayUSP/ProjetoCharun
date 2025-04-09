extends Area2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("playerAttack") : 
		queue_free()
		if AudioManager.blocoDestruido != null:
			AudioManager.blocoDestruido.play()
