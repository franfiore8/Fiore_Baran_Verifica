extends CanvasLayer
func _ready() -> void:
	$text.text= str(globali.BidoneG)

func _on_bidone_giallo_body_entered(body: Node2D) -> void:
	if  globali.NumeroG>0:
		globali.BidoneG=globali.BidoneG+1
		globali.NumeroG=globali.NumeroG-1
	$text.text= str(globali.BidoneG)
