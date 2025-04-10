extends Area2D
class_name EnemyCollisionBox

@export var enemy: Enemy
@export var damage: float

func _on_body_entered(body: Node2D) -> void:
	enemy.causePlayerDamage(damage)
	
	
func onPlayerCauseDamage(damage: float) -> void:
	enemy.applyDamage(damage);
	if AudioManager.atingido != null:
		AudioManager.atingido.play()
