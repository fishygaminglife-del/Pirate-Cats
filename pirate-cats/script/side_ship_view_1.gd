extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_crab_out_mouse_entered() -> void:
	$AnimatedSprite2D.play("default")


func _on_crab_out_mouse_exited() -> void:
	$AnimatedSprite2D.stop()


func _on_dyna_play_mouse_entered() -> void:
	$Dynamite.play("default")


func _on_dyna_play_mouse_exited() -> void:
	$Dynamite.stop()


func _on_bouy_play_mouse_entered() -> void:
	$Bouy.play("default")


func _on_bouy_play_mouse_exited() -> void:
	$Bouy.stop()
