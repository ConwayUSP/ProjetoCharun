extends FlyEnemy

var lastHit: float = 0;

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	var distance_to_player = game_instance.player.position.distance_to(position)
	
	if(distance_to_player <= 10 && lastHit == 0):
		lastHit = 1
		setAnimation("attacking", true)
		completeAttack();
	else:
		setAnimation("flying")
		
	print(lastHit)
		
	if(lastHit > 0):
		lastHit -= delta
	else:
		lastHit = 0
