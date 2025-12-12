extends Area2D
@onready var timer = $TImer

func _on_kill_zone_body_entered(body: Node2D) -> void:
	print("Sei morto")
	timer.start()


func _on_timer_timeout() -> void: 
	get_tree().reload_current_scene()
