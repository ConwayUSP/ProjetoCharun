extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.get_node("playerHitbox").queue_free()
	GameManager.applyDamage(GameManager.life+1)
	print("morreu :(")
