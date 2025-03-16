extends Enemy
class_name FlyEnemy

@export var DETECTION_ZONE: FlyZone
@export var acceleration: float = 300  # Ajuste conforme necessário
@export var max_speed: float = 150  # Limita a velocidade máxima

var velocity: Vector2 = Vector2.ZERO  # Guarda a velocidade atual

func _ready() -> void:
	# Define a animação
	setAnimation("flying", true)

func _physics_process(delta: float) -> void:
	if hitTime > 0 or isDead():
		return

	# Verifica a distância até o player
	var distance_to_player = game_instance.player.position.distance_to(DETECTION_ZONE.position)

	if distance_to_player > DETECTION_ZONE.radius: 
		# Se o player estiver fora do alcance, volta para a posição inicial
		var spawnDir: Vector2 = (DETECTION_ZONE.position - position).normalized()
		targetDirection = spawnDir
	else:
		# Se estiver dentro do alcance, segue o player
		var playerDir: Vector2 = (game_instance.player.position - position).normalized()
		targetDirection = playerDir

	# Aplica aceleração à velocidade
	velocity = velocity.lerp(targetDirection * max_speed, acceleration * delta)

	# Atualiza a posição manualmente
	position += velocity * delta  
