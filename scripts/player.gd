extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -280.0
const MAX_JUPS = 1
var jumps_done = 0
@onready var animeted_sprite = $AnimatedSprite2D


	
func _physics_process(delta: float) -> void:
	
	


	if Input.is_action_just_pressed("jump") and jumps_done < MAX_JUPS:
		velocity.y = JUMP_VELOCITY
		jumps_done += 1
	
	
		
		
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps_done = 0
		


	var direction := Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction > 0:
		animeted_sprite.flip_h = false
	elif direction < 0:
		animeted_sprite.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animeted_sprite.play("idle")
		else:
			animeted_sprite.play("run")
	elif not is_on_floor() and velocity.y > 0:
		animeted_sprite.play("fall")
	elif jumps_done != 1:
		animeted_sprite.play("jump")
	else:
		animeted_sprite.play("double_jump")
	
	
		
	
		
	

	move_and_slide()
