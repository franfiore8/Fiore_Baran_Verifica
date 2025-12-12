extends CanvasLayer

#var countGiallo=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$text.text= str(globali.NumeroG)




func _on_sacco_giallo_body_entered(body):
	globali.NumeroG+=1
	$text.text= str(globali.NumeroG)
	
	

func _on_bidone_giallo_body_entered(body: Node2D) -> void:
	$text.text= str(globali.NumeroG)


func _on_bidone_giallo_body_exited(body: Node2D) -> void:
	$text.text= str(globali.NumeroG)
