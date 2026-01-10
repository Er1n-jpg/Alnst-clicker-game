extends Control
@onready var my_popup = $Popup
@onready var line_edit: LineEdit = $Popup/LineEdit
@onready var label: Label = $Popup/LineEdit/Label
const SWLogger = preload("res://addons/silent_wolf/utils/SWLogger.gd")
const ScoreItem = preload("res://Scenes/Protoypes/scorepanel.tscn")
var list_index = 0
var ld_name = "main"
var max_scores = 10

func _ready() :
	line_edit.text_submitted.connect(_on_LineEdit_text_entered)
	var scores = SilentWolf.Scores.scores
	#var scores = []
	if ld_name in SilentWolf.Scores.leaderboards:
		scores = SilentWolf.Scores.leaderboards[ld_name]
		var local_scores = SilentWolf.Scores.local_scores
		
	
func _on_LineEdit_text_entered(new_text: String) -> void:
	label.text = "Your name is " + new_text
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(new_text, Global.ivans).sw_save_score_complete
	add_item(new_text, str(Global.ivans) )
	my_popup.visible = false
	loadnewleaderboard()

func add_item(player_name: String, score_value: String) -> void:
	var item = ScoreItem.instantiate()
	list_index += 1
	item.get_node("PlayerName").text = player_name
	item.get_node("Score").text = score_value
	item.offset_top = list_index * 100
	$VBoxContainer.add_child(item)
	

func loadnewleaderboard():
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print("Scores: " + str(sw_result.scores)) 
	
func handle_enter_pressed():
	print("Handling enter press!")


func _on_closebutton_pressed() -> void:
	var scene_name = SilentWolf.scores_config.open_scene_on_close
	SWLogger.info("Closing SilentWolf leaderboard, switching to scene: " + str(scene_name))
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")
