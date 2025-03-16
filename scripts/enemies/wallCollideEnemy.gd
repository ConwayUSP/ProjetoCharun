extends FloorMovingEnemy
class_name WallCollideEnemy

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

func _process(delta: float) -> void:
	super._process(delta);
	if(isDead()): return;
	if ray_cast_right.is_colliding() && !attacking:
		targetDirection.x = -1
		tempoVendoOPlayer = 0

	if ray_cast_left.is_colliding() && !attacking:
		targetDirection.x = 1
		tempoVendoOPlayer = 0
			
	if(targetDirection.normalized().x <= 0):
		animated_sprite.flip_h = true
		if(ray_cast_player != null):
			ray_cast_player.target_position.y = -100;
	else:
		animated_sprite.flip_h = false
		if(ray_cast_player != null):
			ray_cast_player.target_position.y = 100;
