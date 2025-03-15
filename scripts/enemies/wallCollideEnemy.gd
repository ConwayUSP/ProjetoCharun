extends Enemy
class_name WallCollideEnemy

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		targetDirection.x = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		targetDirection.x = 1
		animated_sprite.flip_h = false
	super._process(delta);
