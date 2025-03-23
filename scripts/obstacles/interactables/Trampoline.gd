extends StaticBody2D
	
func _on_Detect_body_entered(body):
	if body.has_method("trampoline_boost"):
		body.trampoline_boost()
