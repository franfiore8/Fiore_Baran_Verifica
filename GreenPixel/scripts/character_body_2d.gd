extends CharacterBody2D

const JUMP_VELOCITY = -300.0
const JUMP_2=-220
var VELOCITY:float= 2
var count_jump=0
var max_jump=2
var position1=0
var max_position=2
var max_position2=1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor(): 	
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") : #SALTO DA FERMO
		#position.x=0 check point
		if is_on_floor() :
			velocity.y = JUMP_VELOCITY
			$Animazione.play("jump")		
			count_jump=1	
		elif count_jump<max_jump:
			$Animazione.play("jump")
			velocity.y = JUMP_2
			count_jump+=1
				
	move_and_slide()
	
	# CORSA
func _process(delta):
		var movimento= Vector2.ZERO
		if is_on_floor() : #MOVIMENTO A TERRA A DESTRA E A SINISTRA
			if Input.is_action_pressed("ui_right"):
				movimento.x +=1
				$Animazione.play("run")	
			elif  Input.is_action_pressed("ui_left"):
				movimento.x -=1
				$Animazione.play("reverse_run")	
			else:
				$Animazione.play("stop")		
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
			
			
	
	
