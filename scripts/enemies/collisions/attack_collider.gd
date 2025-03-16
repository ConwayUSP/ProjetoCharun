extends Area2D

@export var enemy: Enemy

func _on_body_entered(body: Node2D) -> void:
	enemy.attack()


func _on_body_exited(body: Node2D) -> void:
	print("stop attack")
	enemy.stopAttack()
