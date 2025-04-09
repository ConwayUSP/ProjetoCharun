extends Node

# Variáveis dos sons (carregadas no _ready)
var pulo: AudioStreamPlayer2D
var coletarMoeda : AudioStreamPlayer2D
var dash : AudioStreamPlayer2D
var atingido : AudioStreamPlayer2D
var morte : AudioStreamPlayer2D
var powerUp : AudioStreamPlayer2D
var tiro : AudioStreamPlayer2D
var cura : AudioStreamPlayer2D

func _ready():
	# Crie os nós de áudio e adicione como filhos
	pulo = AudioStreamPlayer2D.new()
	pulo.stream = preload("res://efeitos_sonoros/pulo.wav")  # Carrega o arquivo de som
	add_child(pulo)  # Adiciona à árvore de nós
	coletarMoeda = AudioStreamPlayer2D.new()
	coletarMoeda.stream = preload("res://efeitos_sonoros/coletarMoeda.wav")  # Carrega o arquivo de som
	add_child(coletarMoeda)  # Adiciona à árvore de nós
	dash = AudioStreamPlayer2D.new()
	dash.stream = preload("res://efeitos_sonoros/dash.wav")  # Carrega o arquivo de som
	add_child(dash)  # Adiciona à árvore de nó
	atingido = AudioStreamPlayer2D.new()
	atingido.stream = preload("res://efeitos_sonoros/inimigoAtingido.wav")  # Carrega o arquivo de som
	add_child(atingido)  # Adiciona à árvore de 
	morte = AudioStreamPlayer2D.new()
	morte.stream = preload("res://efeitos_sonoros/morte.wav")  # Carrega o arquivo de som
	add_child(morte)  # Adiciona à árvore de nó
	powerUp = AudioStreamPlayer2D.new()
	powerUp.stream = preload("res://efeitos_sonoros/powerUp.wav")  # Carrega o arquivo de som
	add_child(powerUp)  # Adiciona à árvore de nó
	tiro = AudioStreamPlayer2D.new()
	tiro.stream = preload("res://efeitos_sonoros/tiro.wav")  # Carrega o arquivo de som
	add_child(tiro)  # Adiciona à árvore de nós
	cura = AudioStreamPlayer2D.new()
	cura.stream = preload("res://efeitos_sonoros/cura.wav")
	add_child(cura)  # Adiciona à árvore de nós
	
	
   
