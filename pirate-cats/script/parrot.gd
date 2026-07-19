extends Node2D
var eating = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func parrot_eat():
	if eating == false:
		eating = true
		$Parrot.play("eating")
		await get_tree().create_timer(2).timeout
		$Parrot.play("default")
		eating = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
