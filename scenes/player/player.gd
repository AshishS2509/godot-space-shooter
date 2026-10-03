extends Node2D

var bullet_scene = preload("res://scenes/bullet/bullet.tscn")
var speed = 900
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction = 0
	var newPosition = position.x 
	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		direction = -1

	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		direction = 1
	newPosition += direction * speed * delta
	position.x = clamp(newPosition, 50.0, 648.0 - 50.0)
	if Input.is_key_pressed(KEY_SPACE):
		shoot(delta)

var shoot_timer := 0.0
var shoot_interval := 0.1
func shoot(delta: float) -> void:
	shoot_timer += delta

	if shoot_timer >= shoot_interval:
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)

		bullet.global_position = global_position + Vector2(0, -50)

		shoot_timer = 0.0
	
