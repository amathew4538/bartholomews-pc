extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var as2D = $AnimatedSprite2D
@onready var jp = $JumpParticles

var is_hovering = false

func _physics_process(delta):
	# 1. Add Gravity (This makes the character fall)
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 2. Handle Jump
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jp.restart()
		jp.emitting = true

	# 3. Handle Movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		as2D.flip_h = direction < 0
		
		# Only trigger 'start_hover' if we are on the floor and starting to move
		if not is_hovering and is_on_floor():
			is_hovering = true
			as2D.play("start_hover")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_hovering:
			is_hovering = false
			as2D.play("idle")

	move_and_slide()
	
	# 4. Handle Air Logic (Overrides move animations if jumping/falling)
	if not is_on_floor():
		as2D.play("hover") # Or a dedicated 'jump' animation if you have one

func _on_animated_sprite_2d_animation_finished() -> void:
	if as2D.animation == "start_hover" and is_hovering:
		as2D.play("hover")
