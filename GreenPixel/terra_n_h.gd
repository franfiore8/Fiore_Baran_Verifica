extends Area2D





func _on_body_entered(body: Node2D) -> void:
	print("zona segreta sbloccata")
	queue_free()
