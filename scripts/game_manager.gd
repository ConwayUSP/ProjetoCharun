extends Node

const caminho: String = "user://Player_Data.tres"

var score = 0
var life = 100.0
var max_life = 100.0
var imunidade = false
@onready var immunity_timer: Timer = $ImmunityTimer  

var player = null
var current_checkpoint = false

@onready var score_label: Label = $HUD/ScoreLabel
@onready var life_label: Label = $HUD/LifeLabel
@onready var timer: Timer = $Timer
	
func _on_immunity_timeout(): # Função para remover a imunidade depois que a duração dela acabar
	imunidade = false
	
func ready(): # Função utilizada para configurar o timer, pode servir para outras coisas futuramente
	immunity_timer = Timer.new()
	add_child(immunity_timer)
	immunity_timer.autostart = false
	immunity_timer.timeout.connect(_on_immunity_timeout)
	
func add_point():
	score += 1
	score_label.text = "Você coletou " + str(score) + " moedas"
	
# Adiciona imunidade ao personagem se ele pegar skill Roll
func add_immunity(duration: float):
	imunidade = true
	get_tree().create_timer(duration).timeout.connect(
		func():
			imunidade = false
			print("Imunidade removida após ", duration, " segundos")
	)

	
func applyDamage(damage: float):
	if damage > 1:
		life -= damage
		life_label.text = "Você possui " + str(life) + " de vida"
		print("Dano de queda recebido: ", damage)
		AudioManager.dano.play()
		print("Vida restante: ", life)
		
		if life <= 0:
			life_label.text = "Você possui 0 de vida"
			if AudioManager.morte != null:
				AudioManager.morte.play()
			death()

func death():
	Engine.time_scale = 0.5
	timer.start()
	print("Voce morreu :(")# Replace with function body.

func _on_timer_timeout() -> void:
	life = 100.0
	score = 0
	score_label.text = "Você coletou " + str(score) + " moedas"
	life_label.text = "Você possui " + str(life) + " de vida"
	Engine.time_scale = 1
	#get_tree().reload_current_scene()
	print("a")
	respawn()

func heal(amount: float):
	life += amount
	life = min(life, max_life)  # Garante que não ultrapasse o máximo
	life_label.text = "Você possui " + str(life) + " de vida"
	print("Vida recuperada! Vida atual: ", life)
	
	
func respawn(): #função de respawn
	player.velocity.y = 0 #zera a velocidade do player pra nn morrer de queda ao respawnar
	if current_checkpoint != false: #checa se o player passaou por um checkpoint
		carregar() #função que carrega o player no último checkpoint
		life = 100 #reseta vida após morrer
		score = 0 #reseta score após morrer
		
		
	else: #reinicia toda a cena caso não tenha passado por um checkpoint
		get_tree().reload_current_scene()
	
func salvar(): #função pra  salvar os dados do player
	var save: Resource = load("res://scripts/resources/player_data.gd").new() #cria um recurso de dados novo
	save.vida = life #define a vida no save
	save.pontos = score #define o score no save
	save.pos_x = player.global_position.x #define a posição x no save
	save.pos_y = player.global_position.y #define a posição y no save
	var err = ResourceSaver.save(save, caminho) #salva o recurso
	
	if err == OK: #se tiver salvado, printa os dados q foram salvos
		print(save.vida)
		print(save.pontos)
		print(save.pos_x)
		print(save.pos_y)
		
		
	else: #se não tiver salvado, printa erro
		print("erro")
		
func carregar(): #função pra carregar um load
	var load = ResourceLoader.load(caminho) #vai atrás do save no PC do usuário e carrega ele
	
	if load: #se tiver carregado, atualiza os dados para aos anteriores e printa
		life = load.vida
		score = load.pontos
		player.global_position.x = load.pos_x
		player.global_position.y = load.pos_y
		print(load.vida)
		print(load.pontos)
		print(load.pos_x)
		print(load.pos_y)
