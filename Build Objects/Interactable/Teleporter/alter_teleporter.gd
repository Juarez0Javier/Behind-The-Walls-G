extends Teleporter
class_name AlterTeleporter

@export var alterTPPoint:Node3D
@export var tpCycles:int
var cycleTag = false

func _ready() -> void:
	if tpPoint:
		tpPoint.body_entered.connect(_on_tpPoint_exited)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		if !tpLock:
			if tpCycles == 0:
				tp_to_point(body,alterTPPoint)
			else:
				cycleTag = true
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
		
func _on_tpPoint_exited(body: Node3D) -> void:
	if body.is_in_group("Player") and cycleTag == true:
		var to_body := (body.global_position - alterTPPoint.global_position).normalized()
		var forward := -alterTPPoint.global_transform.basis.z.normalized()
		if forward.dot(to_body) > 0.0 and tpCycles!=0:
			tpCycles -= 1
			cycleTag = false
	print(tpCycles)
	pass
