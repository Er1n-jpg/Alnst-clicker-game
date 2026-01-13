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
	
		
	
func _on_LineEdit_text_entered(playername: String) -> void:
	label.text = "Your name is " + playername
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(playername, Global.ivans).sw_save_score_complete
	my_popup.visible = false
	Scores

func load():
	scores_container.queue_free_children()
	SilentWolf.Scores.get_scores(20).sw_get_scores_complete.connect(_on_scores_received)
	SilentWilf.Scores.sw_get_scores_failed.connect(_on_scores_failed)
func scoresrecived(scores: Array, names: Array):
	
	for i in range(scores.size()):
		var score_entry: Dictionary = scores[i]
		
		var playername = score_entry.get("playername", "N/A")
		var player_score = score_entry.get("ivans", 0)
		
		newlbentry(i+1, playername, player_score)

func newlbentry(rank: int, playername: String, score_data: Dictionary,) -> HBoxContainer:
	var entry = HBoxContainer.new()
	entry.size_flags_hoprizontal = Control.SIZE_EXPAND_FILL
	
	var rank_label = Label.new()
	rank_label.text = str(rank) + ":"
	rank_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	var name_label = Label.new()
	name_label.text = playername
	name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	var score_label = Label.new()
	score_label.text = score_data["player_name"]
	score_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	entry.add_child(rank_label)
	entry.add_child(name_label)
	entry.add_child(score_label)
	return entry
	
func handle_enter_pressed():
	print("Handling enter press!")


func _on_closebutton_pressed() -> void:
	var scene_name = SilentWolf.scores_config.open_scene_on_close
	SWLogger.info("Closing SilentWolf leaderboard, switching to scene: " + str(scene_name))
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")
