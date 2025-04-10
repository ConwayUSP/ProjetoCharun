extends Node

# Variáveis dos sons (carregadas no _ready)
var pulo: AudioStreamPlayer
var coletarMoeda : AudioStreamPlayer
var dash : AudioStreamPlayer
var atingido : AudioStreamPlayer
var morte : AudioStreamPlayer
var powerUp : AudioStreamPlayer
var tiro : AudioStreamPlayer
var cura : AudioStreamPlayer

func _ready():
	# Crie os nós de áudio e adicione como filhos
	pulo = AudioStreamPlayer.new()
	pulo.stream = preload("res://efeitos_sonoros/pulo.wav")  # Carrega o arquivo de som
	add_child(pulo)  # Adiciona à árvore de nós
	coletarMoeda = AudioStreamPlayer.new()
	coletarMoeda.stream = preload("res://efeitos_sonoros/coletarMoeda.wav")  # Carrega o arquivo de som
	add_child(coletarMoeda)  # Adiciona à árvore de nós
	dash = AudioStreamPlayer.new()
	dash.stream = preload("res://efeitos_sonoros/dash.wav")  # Carrega o arquivo de som
	add_child(dash)  # Adiciona à árvore de nó
	atingido = AudioStreamPlayer.new()
	atingido.stream = preload("res://efeitos_sonoros/inimigoAtingido.wav")  # Carrega o arquivo de som
	add_child(atingido)  # Adiciona à árvore de 
	morte = AudioStreamPlayer.new()
	morte.stream = preload("res://efeitos_sonoros/morte.wav")  # Carrega o arquivo de som
	add_child(morte)  # Adiciona à árvore de nó
	powerUp = AudioStreamPlayer.new()
	powerUp.stream = preload("res://efeitos_sonoros/powerUp.wav")  # Carrega o arquivo de som
	add_child(powerUp)  # Adiciona à árvore de nó
	tiro = AudioStreamPlayer.new()
	tiro.stream = preload("res://efeitos_sonoros/tiro.wav")  # Carrega o arquivo de som
	add_child(tiro)  # Adiciona à árvore de nós
	cura = AudioStreamPlayer.new()
	cura.stream = preload("res://efeitos_sonoros/cura.wav")
	add_child(cura)  # Adiciona à árvore de nós
	
	
   
