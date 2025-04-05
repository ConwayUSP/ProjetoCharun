extends CharacterBody2D
class_name Player

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $playerHitbox
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var fire_cooldown: Timer = $FireCooldown
@onready var marker_2d: Marker2D = $Marker2D
@onready var pulo: AudioStreamPlayer2D = $pulo_som
@onready var tiro: AudioStreamPlayer2D = $tiro_som
@onready var dash: AudioStreamPlayer2D = $dash_som
@onready var hitbox_attack : CollisionShape2D = $AnimatedSprite2D/playerAttack/CollisionShape2D

const FIRE = preload("res://scenes/fire.tscn")

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const VELOCIDADE_LIM = 300.0  
const DANO_MULTI = 0.5   
const DASH_SPEED = 450.0
var can_jump = false
var can_shoot = true
var can_dash = true
var is_dashing = false
var is_attacking = false

var velocidade_queda = 0.0
var  posicao_inicial = Vector2.ZERO  # Posição inicial

func _ready() -> void:
	posicao_inicial = position

func _physics_process(delta: float) -> void:
	# Adicionar gravidade.
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocidade_queda = velocity.y
	else:
		coyote_timer.start(0.09)
		can_jump = true
		
		# Verificar se o personagem sofreu dano de queda
		if velocidade_queda > VELOCIDADE_LIM:
			if !GameManager.imunidade:
				var dano_queda = (velocidade_queda - VELOCIDADE_LIM) * DANO_MULTI
				GameManager.applyDamage(snappedf(dano_queda,0.01))
		velocidade_queda = 0.0  

	# Lidar com o pulo
	if Input.is_action_just_pressed("jump") and can_jump == true:
		if pulo != null:
			pulo.play()
		velocity.y = JUMP_VELOCITY
		can_jump = false
		
	# Lidar com o dash
	if Input.is_action_just_pressed("dash") and can_dash:
		is_dashing = true
		if dash != null:
			dash.play()
		can_dash = false
		$dashTimer.start()
		$dashCooldown.start()
		print("dash!")

	# Obter a direção de movimento: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Virar o Sprite dependendo da direção
	if direction > 0:
		sprite.flip_h = false
		sprite.position.x = -9
		sprite.rotate(0.08)
	elif direction < 0:
		sprite.flip_h = true
		sprite.position.x = 9
		sprite.rotate(-0.08)
			
	# Reproduzir a animação
	if GameManager.imunidade == true:
		sprite.visible = true
	if is_dashing:
		animated_sprite.play("roll")
	elif is_attacking:
		animated_sprite.play("attack")
	else:
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
	
	if is_dashing:
		direction = getPlayerLastDirection()
		velocity.x = direction * DASH_SPEED
		velocity.y = 0
	else:
		# Aplicar o movimento padrão
		if direction:
			velocity.x = direction * SPEED
			animated_sprite.scale.x = direction
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
		# ataque simples, a tecla eh H
	if   Input.is_action_just_pressed("attack") and !is_attacking:
		is_attacking = true
	if is_attacking:
		hitbox_attack.disabled = false
	else:
		hitbox_attack.disabled = true
	
	# Comando para atirar, a tecla de tiro é 'J' ou 'Botão esquerdo do mouse'
	if Input.is_action_pressed("fire") and can_shoot == true:
		shoot()
		fire_cooldown.start(0.4)
		
# Controlar o tempo do "pulo do coyote"
func _on_coyote_timer_timeout() -> void:
	can_jump = false
	
# Função para o personagem atirar
func shoot():
	can_shoot = false
	var bullet = FIRE.instantiate()
	owner.add_child(bullet)
	bullet.position = marker_2d.global_position
	if tiro != null:
		tiro.play()
	if animated_sprite.scale.x > 0:
		bullet.scale = Vector2(0.25, 0.25)
	else:
		bullet.scale = Vector2(-0.25, 0.25)

# Controlar o tempo de cooldown do tiro
func _on_fire_cooldown_timeout() -> void:
	can_shoot = true
	

# Ao finalizar o dash
func _on_dash_timer_timeout() -> void:
	is_dashing = false

# Ao finalizar o cooldown do dash
func _on_dash_cooldown_timeout() -> void:
	can_dash = true
	print("Dash saiu de cooldown")

# Função para decidir a direção do dash, parece que tá ao contrário mas o importante é que funciona.	
func getPlayerLastDirection():
	if (sprite.position.x > 0): return -1
	return 1


# funcao que termina com a animacao de ataque
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "attack":
		is_attacking = false

#verifica se oq esta colidindo com o ataque eh um inimigo ou n´
func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area is EnemyCollisionBox:
		area.onPlayerCauseDamage(10)
