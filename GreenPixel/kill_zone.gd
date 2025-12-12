extends Area2D


func _on_body_entered(body):
	$Timer.start()
	

	 


func _on_timer_timeout():
	get_tree().reload_current_scene()
	globali.NumeroR = 0
	globali.NumeroG = 0
	globali.NumeroB = 0
	globali.BidoneR = 0
	globali.BidoneG = 0
	globali.BidoneB = 0
