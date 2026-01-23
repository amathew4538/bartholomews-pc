extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var as2D = $AnimatedSprite2D
@onready var jp = $JumpParticles

var is_hovering = false
var can_move = true

func _physics_process(delta):
	if not can_move:
		return

	# 1. Add Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 2. Handle Jump
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jp.restart()
		jp.emitting = true

	# 3. Handle Movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		as2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# 4. Handle Animations (The Cleanup)
	update_animations(direction)

func update_animations(direction):
	if not is_on_floor():
		# Play hover whenever in the air
		as2D.play("hover")
		is_hovering = false # Reset this so start_hover can trigger upon landing/moving
	else:
		if direction != 0:
			if not is_hovering:
				is_hovering = true
				as2D.play("start_hover")
			# Note: The animation_finished signal handles switching start_hover -> hover
		else:
			# We are on the floor and NOT moving
			is_hovering = false
			as2D.play("idle")
