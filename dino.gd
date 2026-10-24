extends Node2D

func play_idle_animation() -> void:
	$AnimatedSprite2D.play("idle")

func play_walk_animation() -> void:
	$AnimatedSprite2D.play("walk")

func play_attack_animation() -> void:
	$AnimatedSprite2D.play("attack")
	
func play_hurt_animation() -> void:
	$HurtFlashAnimationPlayer.play("hurt_flash")
