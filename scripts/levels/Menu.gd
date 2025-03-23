extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_B1_pressed():
	get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel1.tscn")


func _on_B2_pressed():
	get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel2.tscn")


func _on_B3_pressed():
	get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel3.tscn")


func _on_B4_pressed():
	get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel4.tscn")


func _on_B5_pressed():
	get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel5.tscn")


func _on_B6_pressed():
	get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel6.tscn")


func _on_B7_pressed():
	get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel7.tscn")


func _on_B8_pressed():
	get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel.tscn")

