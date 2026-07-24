extends Node2D

var you_text = [
	"...",
	"Where am I?",
]
var dialogue = [
	{
		"speaker": "you",
		"name": "",
		"text": "..."
	},
	{
		"speaker": "you",
		"name": "",
		"text": "Where am I?"
	},
	{
		"speaker": "cat",
		"name": "???",
		"text": "Hey."
	},
	{
		"speaker": "cat",
		"name": "???",
		"text": "You're finally awake."
	},
]

var dialogue_index = 0
var typing = false
#var cat_dialogue = [
	#{
		#"name": "???",
		#"text": "Hey.",
	#},
	##{
		##"name": "???",
		##"text": "You're finally awake.",
		##"portrait": preload("res://assets/headshots/POWDER MONKEY FACE.png")
	##},
#]
var you_text_index = 0

func _ready() -> void:
	SaveManager.save_game(SaveManager.current_slot)
	$AnimationPlayer.play("boat craddle")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("showcats")
	await $AnimationPlayer.animation_finished
	$Button.visible=true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/loading.tscn")

		
func show_next_dialogue() -> void:
	if dialogue_index >= dialogue.size():
		$Textbox.visible = false
		$Button.visible = false
		return
	
	var line = dialogue[dialogue_index]
	
	if line["speaker"] == "you":
		$Textbox.visible = false
		$Button.visible = true
		$Button.text = line["text"]
		
	elif line["speaker"] == "cat":
		$Button.visible = false
		show_cat_text(line)


func _on_player_button_pressed() -> void:
	dialogue_index += 1
	show_next_dialogue()


func show_cat_text(line) -> void:
	$Textbox.visible = true
	typing = true
	
	$Textbox/namelabel.text = line["name"]
	$Textbox/textlabel.text = line["text"]
	$Textbox/textlabel.visible_characters = 0
	
	for i in $Textbox/textlabel.text.length():
		$Textbox/textlabel.visible_characters = i
		await get_tree().create_timer(0.05).timeout
	
	typing = false


func _input(event):
	if event.is_action_pressed("ui_accept") and !typing:
		if dialogue_index < dialogue.size() and dialogue[dialogue_index]["speaker"] == "cat":
			dialogue_index += 1
			show_next_dialogue()
