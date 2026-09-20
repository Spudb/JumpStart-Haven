extends Area2D

@onready var score: Label = $"../CanvasLayer/Score"


func _on_body_entered(body: Node2D) -> void:
	Global.score += 1
	score.text = "Score: " + str(Global.score)
	queue_free()
