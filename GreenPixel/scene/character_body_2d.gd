extends CharacterBody2D

var is_alive= true
const JUMP_VELOCITY = -280
const JUMP_2=-200
var VELOCITY:float= 1.8
const GRAVITY:=1000
var count_jump=0
var max_jump=2
var position1=0
var max_position=2
var max_position2=1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor(): 	
		velocity.y += GRAVITY * delta
		
	# Handle jump.
	
	if Input.is_action_just_pressed("ui_accept") : #SALTO DA FERMO
		#position.x=0 check point
		if  is_on_floor() :
			velocity.y = JUMP_VELOCITY
			$Animazione.play("jump")	
			count_jump=1	
		elif count_jump<max_jump:
			$Animazione.play("jump")
			velocity.y = JUMP_2
			count_jump+=1
	else:
		if is_on_floor() : #MOVIMENTO A TERRA A DESTRA E A SINISTRA
			if Input.is_action_pressed("ui_right"):
				$Animazione.play("run")
				
			
			elif   Input.is_action_pressed("ui_left"):
				$"Animazione".play("reverse_run")
		
		else:
				$Animazione.play("stop")
		

				
	move_and_slide()
	
var is_moving=false# CORSA
var moving_left=false
func _process(delta):
		var movimento= Vector2.ZERO
		if is_on_floor() : #MOVIMENTO A TERRA A DESTRA E A SINISTRA
			if Input.is_action_pressed("ui_right"):
				movimento.x +=1
				if not is_moving or moving_left:
					$Animazione.play("run")	
					is_moving= true
					moving_left= false
			elif  Input.is_action_pressed("ui_left"):
				movimento.x -=1
				if not is_moving or not moving_left:
					$Animazione.play("reverse_run")	
					is_moving=true
					moving_left=true
			else:
				if is_moving:
					if moving_left:
						$Animazione.play("reverse_stop")
					else:
						$Animazione.play("stop")
					is_moving=false
					  
					
			movimento= movimento.normalized()
			move_and_collide(movimento*VELOCITY)
		else : #MOVIMENTO IN ARIA DESTRA E SINISTRA
			position1+=1
			if Input.is_action_pressed("ui_right"):
				movimento.x +=1
				$Animazione.play("jump")	

			elif  Input.is_action_pressed("ui_left"):
				movimento.x -=1
				$Animazione.play("reverse_jump")	
			else:
				$Animazione.play("stop")
			
			movimento= movimento.normalized()
			move_and_collide(movimento*VELOCITY)
func die():
	is_alive= false
	$Animazione.play("death_animation")
	

	
	
		
