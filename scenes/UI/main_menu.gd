extends CanvasLayer

var option_scene = preload("res://scenes/UI/option_menu.tscn")

func _ready():
	$%PlayButton.pressed.connect(on_play_pressed)
	$%UpgradeButton.pressed.connect(on_upgrade_pressed)
	$%OptionButton.pressed.connect(on_option_pressed)
	$%QuitButton.pressed.connect(on_quit_pressed)
	

func on_play_pressed():
	#ScreenTransition.transition()
	#await ScreenTransition.transitioned_halfway
	
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
	
func on_option_pressed():
	#ScreenTransition.transition()
	#await ScreenTransition.transitioned_halfway
	
	var option_instance = option_scene.instantiate()
	add_child(option_instance)
	option_instance.back_pressed.connect(on_option_closed.bind(option_instance))
	
	
func on_quit_pressed():
	get_tree().quit()

func on_option_closed(option_insteance: Node):
	option_insteance.queue_free()

func on_upgrade_pressed():
	get_tree().change_scene_to_file("res://scenes/UI/meta_menu.tscn")
