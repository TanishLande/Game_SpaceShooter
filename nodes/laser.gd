extends Node2D
@export var speed = 500

func _ready():
	$PixelLaserYellow.scale = Vector2(0,0)
	var tweeen = create_tween()
	tweeen.tween_property($PixelLaserYellow,'scale',Vector2(1,1),0.2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed*delta


func _on_area_2d_area_entered(area):
	area.queue_free()
	queue_free()
	
