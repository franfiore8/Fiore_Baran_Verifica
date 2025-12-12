extends Area2D




func _on_body_entered(body: Node2D) -> void:
	print("+1 spazzatura")

	queue_free()


func _on_bidoneblu_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
