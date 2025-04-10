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
var dano : AudioStreamPlayer

const SFX_BUS = "SFX"

func _ready():
	# Crie os nós de áudio e adicione como filhos
	pulo = AudioStreamPlayer.new()
	pulo.bus = SFX_BUS
	pulo.stream = preload("res://efeitos_sonoros/pulo.wav")  # Carrega o arquivo de som
	add_child(pulo)  # Adiciona à árvore de nós
	
	coletarMoeda = AudioStreamPlayer.new()
	coletarMoeda.bus = SFX_BUS
	coletarMoeda.stream = preload("res://efeitos_sonoros/coletarMoeda.wav")  # Carrega o arquivo de som
	add_child(coletarMoeda)  # Adiciona à árvore de nós
	
	dash = AudioStreamPlayer.new()
	dash.bus = SFX_BUS
	dash.stream = preload("res://efeitos_sonoros/dash.wav")  # Carrega o arquivo de som
	add_child(dash)  # Adiciona à árvore de nó
	
	atingido = AudioStreamPlayer.new()
	atingido.bus = SFX_BUS
	atingido.stream = preload("res://efeitos_sonoros/inimigoAtingido.wav")  # Carrega o arquivo de som
	add_child(atingido)  # Adiciona à árvore de 
	
	morte = AudioStreamPlayer.new()
	morte.bus = SFX_BUS
	morte.stream = preload("res://efeitos_sonoros/morte.wav")  # Carrega o arquivo de som
	add_child(morte)  # Adiciona à árvore de nó
	
	powerUp = AudioStreamPlayer.new()
	powerUp.bus = SFX_BUS
	powerUp.stream = preload("res://efeitos_sonoros/powerUp.wav")  # Carrega o arquivo de som
	add_child(powerUp)  # Adiciona à árvore de nó
	
	tiro = AudioStreamPlayer.new()
	tiro.bus = SFX_BUS
	tiro.stream = preload("res://efeitos_sonoros/tiro.wav")  # Carrega o arquivo de som
	add_child(tiro)  # Adiciona à árvore de nós
	
	cura = AudioStreamPlayer.new()
	cura.bus = SFX_BUS
	cura.stream = preload("res://efeitos_sonoros/cura.wav")
	add_child(cura)  # Adiciona à árvore de nós
	
	dano = AudioStreamPlayer.new()
	dano.bus = SFX_BUS
	dano.stream = preload("res://efeitos_sonoros/hurt.wav")
	add_child(dano) # Adiciona à árvore de nós
