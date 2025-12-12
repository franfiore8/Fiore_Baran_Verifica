extends CanvasLayer
func _ready() -> void:
	$text.text= str(globali.BidoneB)
	


func _on_bidoneblu_body_entered(body: Node2D) -> void:
	if  globali.NumeroB>0:
		globali.BidoneB=globali.BidoneB+1
		globali.NumeroB=globali.NumeroB-1
	$text.text= str(globali.BidoneB)
