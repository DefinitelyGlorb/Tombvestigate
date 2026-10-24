extends CharacterBody2D

func _ready():
	$Eye.flip_h = true
	$Eye.play_idle_animation()
