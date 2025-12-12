extends CanvasLayer

#var countBlu=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$text.text= str(globali.NumeroB)




func _on_sacco_blu_body_entered(body):
	globali.NumeroB= globali.NumeroB+1
	$text.text= str(globali.NumeroB)


func _on_bidoneblu_body_exited(body: Node2D) -> void:
	$text.text= str(globali.NumeroB)


func _on_bidoneblu_body_entered(body: Node2D) -> void:
	$text.text= str(globali.NumeroB)
