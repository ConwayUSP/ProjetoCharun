extends Node2D
class_name Enemy

var targetDirection = Vector2(0,0);
const SPEED = 10;

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	position.x += targetDirection.x * SPEED * delta
	position.y += targetDirection.y * SPEED * delta;

func causePlayerDamage(damage: float) -> void:
	GameManager.applyDamage(damage)
