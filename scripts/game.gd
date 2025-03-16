extends Node2D
class_name Game

@export var player: Player;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.max_fps = 60
