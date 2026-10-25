extends CharacterBody2D

signal health_depleted

const SPEED = 600.0
const AIR_SPEED = 750.0
const JUMP_VELOCITY = -750.0

@onready var dino_sprite = %dino/AnimatedSprite2D

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var max_health = 6.0
var health = max_health

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_released("jump"):
			velocity.y = lerp(velocity.y, gravity * delta, 0.65)
	
	if Input.is_action_just_pressed("attack"):
		%dino.play_attack_animation()
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		else:
			$jump_buffer.start(0.10)
	if $jump_buffer.time_left > 0 and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$jump_buffer.stop()
		
	if Input.is_action_just_pressed("crouch") and is_on_floor():
		set_collision_mask_value(5, false)
	if velocity.y >= 450 and not Input.is_action_pressed("crouch"):
		set_collision_mask_value(5, true)

	var direction = Input.get_axis("move_left", "move_right")
	if not is_on_floor():
		velocity.x = direction * AIR_SPEED
	else:
		velocity.x = direction * SPEED
	if direction < 0:
		dino_sprite.flip_h = true
	if direction > 0:
		dino_sprite.flip_h = false
	if direction != 0:
		%dino.play_walk_animation()
	else:
		dino_sprite.play("default")
	move_and_slide()
	
	var overlapping_enemies = $Hurtbox.get_overlapping_bodies()
	if overlapping_enemies.size() > 0 and $hurt_buffer.time_left == 0:
		take_damage()
	
func take_damage():
	health -= 1.0
	$hurt_buffer.start(2.5)
	$HealthBar.value = health
	if health <= 0:
		health_depleted.emit()
	if health > 0:
		if %dino/HurtFlashAnimationPlayer.is_playing():
			%dino/HurtFlashAnimationPlayer.play("RESET")
		%dino.play_hurt_animation()

func _on_hurt_buffer_timeout() -> void:
	%dino/HurtFlashAnimationPlayer.play("RESET")
