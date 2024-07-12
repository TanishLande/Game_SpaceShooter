extends Control


var level_scene:PackedScene = load("res://nodes/level.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot "):
		get_tree().change_scene_to_packed(level_scene)
