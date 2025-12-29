extends Control
var deleteall = true
func _on_load_pressed():
	get_tree().call_group("clicker","load_data")
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")



func _on_save_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")
	
	
	
