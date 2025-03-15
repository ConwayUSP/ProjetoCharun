extends Node2D
class_name Enemy

var targetDirection = Vector2(0,0);
const SPEED = 10;
@export var health = 100;

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	position.x += targetDirection.x * SPEED * delta
	position.y += targetDirection.y * SPEED * delta;
	
func applyDamage(damage: float) -> void:
	health -= damage;
	verifyDeath()
	
func die() -> void:
	queue_free()	

func verifyDeath() -> void:
	if(health <= 0):
		die()

func causePlayerDamage(damage: float) -> void:
	GameManager.applyDamage(damage)
