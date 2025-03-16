extends Node2D
class_name Enemy

var targetDirection = Vector2(0,0);
@export var SPEED = 10;
@export var health = 100;
@export var game_instance: Game;
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var hitTime: float = 0;

var animationPlaying = false

func isDead() -> bool:
	return health <= 0

func _physics_process(delta: float) -> void:
	if(hitTime > 0 || isDead()): return
	position.x += targetDirection.x * SPEED * delta
	position.y += targetDirection.y * SPEED * delta;
	
func _process(delta: float) -> void:
	animated_sprite.speed_scale = SPEED / 10
	if(hitTime > 0): hitTime -= delta;
	else: hitTime = 0;
	
func setAnimation(animation: String, overridable: bool = false) -> void:
	if((animated_sprite.animation != animation && !animationPlaying) || overridable):
		animationPlaying = true
		animated_sprite.play(animation)
		
var attacking = false;
		
func attack() -> void:
	if(isDead()): return;
	setAnimation("attacking", true)
	attacking = true
	beginAttack()
	
func _on_animated_sprite_2d_animation_looped() -> void:
	if(isDead()): return;
	if(attacking):
		beginAttack()
	
func beginAttack() -> void:
	if(isDead()): return;
	await get_tree().create_timer(0.25).timeout
	completeAttack()
	
func completeAttack() -> void:
	if(isDead()): return;
	print(game_instance.player.position.distance_to(position))
	if(game_instance.player.position.distance_to(position) < 15):
		causePlayerDamage(30)
	
func stopAttack() -> void:
	if(isDead()): return;
	print("stop attack")
	animationPlaying = false
	attacking = false
	
func onAnimationFinished() -> void:
	animationPlaying = false

func applyDamage(damage: float) -> void:
	if(isDead()): return;
	health -= damage;
	setAnimation("hit", true)
	hitTime = 0.5;
	verifyDeath()
	
func die() -> void:
	print("cabo pro bixin")
	setAnimation("death", true)

func verifyDeath() -> void:
	if(isDead()):
		die()

func causePlayerDamage(damage: float) -> void:
	if(isDead()): return;
	GameManager.applyDamage(damage)
