extends Area3D

@export var lvTo: String

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and lvTo:
		GameManager.levelSwap(lvTo)
	pass # Replace with function body.
