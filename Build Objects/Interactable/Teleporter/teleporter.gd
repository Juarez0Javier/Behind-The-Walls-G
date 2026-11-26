extends Area3D
class_name Teleporter

@export var tpPoint: Node3D = null

var tpLock = false

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") && !tpLock:
		tp_to_point(body,tpPoint)
	pass # Replace with function body.

func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		if tpLock:
			var to_body := (body.global_position - global_position).normalized()
			var forward := -global_transform.basis.z.normalized()
			if forward.dot(to_body) < 0.0:
				tp_to_point(body,tpPoint)
		tpLock = false
	pass # Replace with function body.
	
func tp_to_point(body,point):
		if tpPoint:
			var tpPos = point.global_position + (body.global_position - self.global_position)
			body.position = tpPos
			body.rotate_y(deg_to_rad(point.rotation.y))
			point.tpLock = true
