extends Area2D

var active = false

#script de checkpoint
#quando o player entra na AREA2D o checkpoint é ativado
#chamando a func "salvar()" e fazendo com a cena não reinicie
#ver func "respawn()" no game_manager

func _on_body_entered(_body: Node2D) -> void:
	print("player entrou")
	if active == true:
		return
	else:
		active = true
		print("Checkpoint ativo")
		GameManager.current_checkpoint = true
		GameManager.salvar()
