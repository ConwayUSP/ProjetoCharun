extends Node

var score = 0

@onready var score_label: Label = $HUD/ScoreLabel

func add_point():
	score += 1
	score_label.text = "Você coletou " + str(score) + " moedas"

func morreu():
	score = 0
	score_label.text = "Você coletou " + str(score) + " moedas"
