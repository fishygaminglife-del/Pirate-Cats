extends Node2D
var bobber = false  #this is if there is no fish on the line but they only cast it (true)
var fishing = false #this is if the fish is caught and usr is not (false) playing mini game
var time
var fish = 1
var fight_style

func _ready() -> void:
	$fishbub.visible = false

func _on_button_pressed() -> void:
	var pos = Vector2(get_global_mouse_position())
	print(pos)
	if bobber == false:
		bobber = true
		$bobber.visible = true
		$bobber.position = pos
		var bob_pos: Vector2 = $bobber.global_position
		$fishbub.global_position = bob_pos
		$fishbub2.global_position = bob_pos
		print($fishbub.global_position)
		print(pos)
		rand_time()
		print("cast")
	
	elif bobber == true and fishing == false:
		bobber = false
		fishing = false
		$bobber.visible = false
		$FishingTimer.stop()
		print("realled")
		
	elif bobber == true and fishing == true:
		var target_x: float = $Slider.position.x + 15
		var tween: Tween = create_tween()
		tween.tween_property($Slider, "position:x", target_x, 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

func rand_time():
	time = randi_range(2, 7)
	$FishingTimer.wait_time = time
	$FishingTimer.start()

func _on_fishing_timer_timeout() -> void:
	fishing = true
	if bobber == true and fishing == true:
		$fishbub.visible = true
		$fishbub2.frame = 0
		$fishbub.frame = 0
		$fishbub.play("default")
		$fishbub2.play("default")
		$fishbub2.visible = true
		print('fighting fish')
		fight_type()
		
func _physics_process(delta: float) -> void:
	if fishing == true and fight_style == "stream":
		$Slider.position.x -= 15 * delta	
		
func slide_move():
	if fish == 1:
		var target_x: float = $Slider.position.x - 40
		var tween: Tween = create_tween()
		tween.tween_property($Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		fight_type()

func fight_type():
	print(fight_style)
	var fish_type = randi_range(1,3)
	if fish_type == 1:
		fight_style = "stream"
		var time_fight = randi_range(1,5)
		await get_tree().create_timer(time_fight).timeout
	elif fish_type == 2:
		fight_style = "fight"
		slide_move()
	print(fight_type)
