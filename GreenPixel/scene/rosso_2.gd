extends CanvasLayer



func _on_bidone_rosso_body_entered(body: Node2D) -> void:
	if  globali.NumeroR>0:
		globali.BidoneR=globali.BidoneR+1
		globali.NumeroR=globali.NumeroR-1
	print(globali.BidoneR)
	$text.text= str(globali.BidoneR)
