extends Enemy
class_name FloorMovingEnemy

@export var ray_cast_floor: RayCast2D
@export var ray_cast_player: RayCast2D

var playerPosition: Vector2 = Vector2(0,0) 
var tempoVendoOPlayer: float = 0;
var targettingPlayer:bool = false;

func walking() -> void:
	setAnimation("walking")
	
func idling() -> void:
	setAnimation("idling")
	
func attack() -> void:
	super.attack()
	targetDirection.x = 0
	targetDirection.y = 0
	
func _process(delta: float) -> void:
	super._process(delta)
	
	if(hitTime > 0): return
	if(isDead()): return;
	
	if(targetDirection.length() != 0):
		walking()
	else:
		idling()
		
	if(ray_cast_player != null && ray_cast_player.is_colliding()):
		tempoVendoOPlayer = 1;
	elif(tempoVendoOPlayer > 0):
		tempoVendoOPlayer -= delta;
	else: return
		
	if(tempoVendoOPlayer > 0):
		playerPosition = game_instance.player.position;
	elif(targettingPlayer && !attacking):
		targettingPlayer = false
		targetDirection.x = -1;
		return
		
	var playerDirection = playerPosition - position;
		
	targetDirection.x = playerDirection.normalized().x;
	targettingPlayer = true
		
var velocityY = 0;
const GRAVITY = 9.8;

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	velocityY += GRAVITY * delta;
	
	if(ray_cast_floor.is_colliding()):
		velocityY = 0;
		
	position.y += velocityY;
