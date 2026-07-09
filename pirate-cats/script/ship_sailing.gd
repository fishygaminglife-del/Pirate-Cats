extends Node2D

func _ready() -> void:
	SaveManager.save_game(SaveManager.current_slot)
	$AnimationPlayer.play("boat craddle")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("showcats")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/loading.tscn")
