extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Global.avocado == false:
		$Avocado.visible = true
		$Pit.visible = false
		print("f")
	else:
		$Avocado.visible = false
		$Pit.visible = true
		print("t")
