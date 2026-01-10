extends Control
var deleteall = true

func _ready():
	SilentWolf.configure({
	"api_key": "ROqAaJ0G396KunYxW6phW3hkRvCECqTz18yyeSf4",
	"game_id": "Clicker",
	"log_level": 1
	})
	
	SilentWolf.configure_scores({
	"open_scene_on_close": "res://Scenes/Starting_screen.tscn"
  })
func _on_load_pressed():
	get_tree().call_group("clicker","load_data")
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")



func _on_save_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")
	
	
	
