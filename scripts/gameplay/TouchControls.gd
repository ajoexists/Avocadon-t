extends CanvasLayer


func _ready():
	$AvocadoSwitch.show()
	$PitSwitch.hide()
	

func _on_PitSwitch_pressed():
	$PitSwitch.hide()
	$AvocadoSwitch.show()


func _on_AvocadoSwitch_pressed():
	$AvocadoSwitch.hide()
	$PitSwitch.show()
