extends Node

var score = 0
var life = 100.0
var imunidade = false

@onready var score_label: Label = $HUD/ScoreLabel
@onready var life_label: Label = $HUD/LifeLabel
@onready var timer: Timer = $Timer

func add_point():
	score += 1
	score_label.text = "Você coletou " + str(score) + " moedas"
	
# Adiciona imunidade ao personagem se ele pegar skill Roll
func add_imunity():
	imunidade = true
	
func applyDamage(damage: float):
	life -= damage
	life_label.text = "Você possui " + str(life) + " de vida"
	print("Dano de queda recebido: ", damage)
	print("Vida restante: ", life)
	
	if life <= 0:
		life_label.text = "Você possui 0 de vida"
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
	get_tree().reload_current_scene()
	print("a")
