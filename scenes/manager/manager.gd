
extends Node2D

var red = preload("res://scenes/enemy/enemy-red.tscn")
var blue = preload("res://scenes/enemy/enemy-blue.tscn")
var yellow = preload("res://scenes/enemy/enemy-yellow.tscn")

var rng = RandomNumberGenerator.new()


func _ready() -> void:
	rng.randomize()
	spawn_loop()


func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


func spawn_loop() -> void:
	while true:
		await get_tree().create_timer(
			rng.randf_range(0.6, 1.2)
		).timeout

		var count = 2 if rng.randf() < 0.05 else 1

		for i in range(count):
			spawn_enemy()


func spawn_enemy() -> void:
	var scenes = [red, blue, yellow]
	var enemy = scenes[rng.randi_range(0, scenes.size() - 1)].instantiate()
	enemy.add_to_group("enemies")

	get_tree().current_scene.add_child(enemy)

	enemy.global_position = Vector2(
		rng.randf_range(50.0, 648- 50.0),
		-100.0
	)
