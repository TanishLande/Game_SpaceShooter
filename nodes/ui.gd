extends CanvasLayer

var result := 0  

signal score 

func set_health(amount):
	for child in  $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		
	for i in amount:
		var text = TextureRect.new()
		text.texture =  load("res://asset/ship_green_stroked.png")
		$MarginContainer2/HBoxContainer.add_child(text)
		text.stretch_mode = TextureRect.STRETCH_KEEP


func _on_timerscore_timeout():
	result += 1
	$MarginContainer/Label.text = str(result)
	
