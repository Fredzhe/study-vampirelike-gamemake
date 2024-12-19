extends CanvasLayer


@onready var panel_container = %PanelContainer

var is_closing
var option_menu_scene = preload("res://scenes/UI/option_menu.tscn")


func _ready():
	get_tree().paused = true
	panel_container.pivot_offset = panel_container.size / 2
	
	%ResumeButton.pressed.connect(on_resume_pressed)
	%OptionButton.pressed.connect(on_option_pressed)
	%QuitButton.pressed.connect(on_quit_pressed)
	
	$AnimationPlayer.play("default")
	
	var tween = create_tween()
	tween.tween_property(panel_container, "scale", Vector2.ZERO, 0)
	tween.tween_property(panel_container, "scale", Vector2.ONE, .15)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		close()
		get_tree().root.set_input_as_handled()
		
		
func close():
	if is_closing:
		return
	is_closing = true
	
	$AnimationPlayer.play_backwards("default")
	
	var tween = create_tween()
	tween.tween_property(panel_container, "scale", Vector2.ONE, 0)
	tween.tween_property(panel_container, "scale", Vector2.ZERO, .15)\
	.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
	
	await tween.finished
	get_tree().paused = false
	queue_free()


func on_resume_pressed():
	close()

func on_option_pressed():
	var option_menu_instance = option_menu_scene.instantiate()
	add_child(option_menu_instance)
	option_menu_instance.back_pressed.connect(on_option_back_pressed.bind(option_menu_instance))
	
func on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")
	
	
func on_option_back_pressed(option_menu: Node):
	option_menu.queue_free()
	
