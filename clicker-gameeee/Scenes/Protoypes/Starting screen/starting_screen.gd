extends Control


@export var game_node: ProtoypeClicker

func _ready() -> void:
	game_node = get_node("res://Scenes/Protoypes/Clicker/clicker.gd")

func _on_load_pressed() -> void:
	game_node.load_data()
	game_node.visible = true
	self.visible = false
	


func _on_save_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")
	
