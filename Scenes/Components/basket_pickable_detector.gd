extends Area3D

signal figure_entered(body)


func _on_body_entered(body: Node3D) -> void:
	## Cuando una figura entra se evalua que clase es, si es cubo, esfera, etc
	figure_entered.emit(body)
	pass # Replace with function body.
