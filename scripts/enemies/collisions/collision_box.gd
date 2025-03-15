extends Area2D

@export var enemy: Enemy
@export var damage: float

func _on_body_entered(body: Node2D) -> void:
	enemy.causePlayerDamage(damage)
