extends CharacterBody2D

const RUN_SPEED = 300.0
const JUMP_VELOCITY = -450.0

@onready var as2D = $AnimatedSprite2D
@onready var jump_timer = $JumpTimer
@onready var jump_particles = $JumpParticles # Reference to the particles

func _ready():
	if jump_timer:
		jump_timer.timeout.connect(_on_jump_timer_timeout)
		_start_random_timer()

func _physics_process(delta):
	velocity.x = RUN_SPEED
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
	
	# Screen Wrap
	var screen_width = get_viewport_rect().size.x
	if position.x > screen_width + 100:
		position.x = -100
	
	update_animations()

func update_animations():
	if is_on_floor():
		as2D.play("hover")
	else:
		as2D.play("jump")

func _on_jump_timer_timeout():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		# TRIGGER PARTICLES HERE
		jump_particles.restart() 
		jump_particles.emitting = true
	_start_random_timer()

func _start_random_timer():
	jump_timer.wait_time = randf_range(0.5, 1.5)
	jump_timer.start()
