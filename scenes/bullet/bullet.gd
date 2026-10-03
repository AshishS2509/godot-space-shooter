extends Node2D


func _ready() -> void:
	pass 

var speed = 900.0
func _process(delta: float) -> void:
	position.y -= speed * delta
