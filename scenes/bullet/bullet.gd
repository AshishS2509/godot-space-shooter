extends Node2D

@onready var hitbox: Area2D = $Area2D

func _ready() -> void:
	hitbox.area_entered.connect(_on_area_entered)

var speed := 900.0
func _process(delta: float) -> void:
	position.y -= speed * delta

func _on_area_entered(area: Area2D) -> void:
	var enemy := area.get_parent()
	if enemy.is_in_group("enemies"):
		enemy.queue_free()
		queue_free()
