extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$text.text=str(globali.NumeroR)


func _on_sacco_rosso_body_entered(body) :
	globali.NumeroR=globali.NumeroR+1 # Replace with function body.
	$text.text=str(globali.NumeroR)


func _on_bidone_rosso_body_exited(body: Node2D) -> void:
	$text.text=str(globali.NumeroR)


func _on_bidone_rosso_body_entered(body: Node2D) -> void:
	$text.text=str(globali.NumeroR)
