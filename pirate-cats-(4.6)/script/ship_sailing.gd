extends Node2D

var you_text = [
	"...",
	"Where am I?",
]
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


func _on_player_button_pressed() -> void:
	you_text_index +=1
	$Button.text = you_text[you_text_index]
