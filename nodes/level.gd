extends Node2D

#we loaded the scene of meteroid in variable meteor_scene 
var meteor_scene: PackedScene = load("res://nodes/metroids.tscn")
var laser_scene: PackedScene = load("res://nodes/laser.tscn")

var health:int = 5


func _ready():
	get_tree().call_group('ui','set_health',health)

func _on_metroidstimer_timeout():
	#we created the instance of variable 
	var meteor = meteor_scene.instantiate()
	
	#attached the scene to node tree 
	$meteors.add_child(meteor)
	
	#collision signal
	meteor.connect('collision', on_meteor_collision)
	
func on_meteor_collision():
	health -= 1
	get_tree().call_group('ui','set_health',health)
	if health <=0:
		get_tree().change_scene_to_file("res://nodes/game_over.tscn")



func _on_player_laser(pos):
	print("shooting laser")
	var laser = laser_scene.instantiate()
	$lasers.add_child(laser)
	laser.position = pos 
	
