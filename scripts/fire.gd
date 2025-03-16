extends Node2D

const VELOCITY = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * VELOCITY * delta


# Função que mata inimigos
func _on_area_entered(area: Area2D) -> void:
	if area is EnemyCollisionBox:
		area.onPlayerCauseDamage(10)
		queue_free()
