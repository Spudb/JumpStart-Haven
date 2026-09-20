extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $Sprite2D
var is_flipped = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			animated_sprite_2d.play("walking")
			if is_flipped == true:
				animated_sprite_2d.flip_h = velocity.x < 0
		elif velocity.x < 0:
			animated_sprite_2d.flip_h = velocity.x < 0
			is_flipped = true
			animated_sprite_2d.play("walking")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.play("Idle")

	move_and_slide()
