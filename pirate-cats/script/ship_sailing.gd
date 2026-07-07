extends Node2D

func _ready() -> void:
	SaveManager.save_game(SaveManager.current_slot)
	$AnimationPlayer.play("boat craddle")
