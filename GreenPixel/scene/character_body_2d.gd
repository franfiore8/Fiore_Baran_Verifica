## @file player.gd
# @brief Script del personaggio giocante.
# @author [Tuo Nome]
# @details Gestisce il movimento, i salti, la gravità e le animazioni del giocatore.

## Classe che estende CharacterBody2D per il personaggio giocante.
extends CharacterBody2D

## Indica se il personaggio è vivo (true) o morto (false).
var is_alive: bool = true

## Velocità di salto iniziale (valore negativo perché Godot usa Y verso il basso).
const JUMP_VELOCITY: float = -280.0

## Velocità di salto secondario (doppio salto).
const JUMP_2: float = -200.0

## Moltiplicatore di velocità per il movimento orizzontale.
var VELOCITY: float = 1.8

## Forza di gravità applicata al personaggio.
const GRAVITY: float = 1000.0

## Contatore dei salti effettuati (per gestire il doppio salto).
var count_jump: int = 0

## Numero massimo di salti consentiti (2 = doppio salto).
var max_jump: int = 2

## Posizione temporanea per logiche di movimento (non usata attualmente).
var position1: int = 0

## Limite massimo per position1 (non usato attualmente).
var max_position: int = 2

## Limite massimo alternativo per position1 (non usato attualmente).
var max_position2: int = 1

## @brief Gestisce la fisica del personaggio (gravità, salti, movimento).
# @param delta Tempo trascorso dall'ultimo frame (in secondi).
# @return void
func _physics_process(delta: float) -> void:
    # Applica la gravità se il personaggio non è a terra.
    if not is_on_floor():
        velocity.y += GRAVITY * delta

    # Gestione del salto.
    if Input.is_action_just_pressed("ui_accept"):  # Salto (tasto spazio/enter)
        if is_on_floor():  # Salto da terra
            velocity.y = JUMP_VELOCITY
            $Animazione.play("jump")
            count_jump = 1
        elif count_jump < max_jump:  # Doppio salto
            $Animazione.play("jump")
            velocity.y = JUMP_2
            count_jump += 1
    else:
        if is_on_floor():  # Movimento a terra (destra/sinistra)
            if Input.is_action_pressed("ui_right"):
                $Animazione.play("run")
            elif Input.is_action_pressed("ui_left"):
                $"Animazione".play("reverse_run")
        else:
            $Animazione.play("stop")

    move_and_slide()

## Indica se il personaggio si sta muovendo (per gestire le animazioni).
var is_moving: bool = false

## Indica se il personaggio si sta muovendo a sinistra (per animazioni).
var moving_left: bool = false

## @brief Gestisce il movimento orizzontale del personaggio.
# @param delta Tempo trascorso dall'ultimo frame (in secondi).
# @return void
func _process(delta: float) -> void:
    var movimento: Vector2 = Vector2.ZERO

    if is_on_floor():  # Movimento a terra
        if Input.is_action_pressed("ui_right"):
            movimento.x += 1
            if not is_moving or moving_left:
                $Animazione.play("run")
                is_moving = true
                moving_left = false
        elif Input.is_action_pressed("ui_left"):
            movimento.x -= 1
            if not is_moving or not moving_left:
                $Animazione.play("reverse_run")
                is_moving = true
                moving_left = true
        else:
            if is_moving:
                if moving_left:
                    $Animazione.play("reverse_stop")
                else:
                    $Animazione.play("stop")
                is_moving = false

        movimento = movimento.normalized()
        move_and_collide(movimento * VELOCITY)
    else:  # Movimento in aria
        position1 += 1
        if Input.is_action_pressed("ui_right"):
            movimento.x += 1
            $Animazione.play("jump")
        elif Input.is_action_pressed("ui_left"):
            movimento.x -= 1
            $Animazione.play("reverse_jump")
        else:
            $Animazione.play("stop")

        movimento = movimento.normalized()
        move_and_collide(movimento * VELOCITY)

## @brief Imposta lo stato del personaggio come "morto".
# @return void
func die() -> void:
    is_alive = false
    $Animazione.play("death_animation")
