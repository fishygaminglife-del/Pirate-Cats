extends Node2D
var O1 = false
var O2 = false
var O3 = false
var mouse_pos: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_pos = get_global_mouse_position()
	round1()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func round1():
	while $Round1/Dirt1.modulate.a > 0.0 or $Round1/Dirt2.modulate.a > 0.0 or $Round1/Dirt3.modulate.a > 0.0:
		if O1 == true and mouse_pos.distance_to(get_global_mouse_position()) >= 10:
			print("dirt1")
			$Round1/Dirt1.modulate.a = max(0.0, $Round1/Dirt1.modulate.a - 0.1)
		if O2 == true and mouse_pos.distance_to(get_global_mouse_position()) >= 10:
			print('dirt2')
			$Round1/Dirt2.modulate.a = max(0.0, $Round1/Dirt2.modulate.a - 0.1)
		if O3 == true and mouse_pos.distance_to(get_global_mouse_position()) >= 10:
			print('dirt3')
			$Round1/Dirt3.modulate.a = max(0.0, $Round1/Dirt3.modulate.a - 0.1)
				
		mouse_pos = get_global_mouse_position()
		await get_tree().create_timer(0.5).timeout
		round1()





func _on_o_1_mouse_entered() -> void:
	O1 = true

func _on_o_1_mouse_exited() -> void:
	O1 = false


func _on_o_2_mouse_entered() -> void:
	O2 = true


func _on_o_2_mouse_exited() -> void:
	O2 = false


func _on_o_3_mouse_entered() -> void:
	O3 = true


func _on_o_3_mouse_exited() -> void:
	O3 = false
