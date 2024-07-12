extends CharacterBody2D



@export var speed := 500
signal laser(pos)
var can_shoot: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(500,400)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	position += direction * speed * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot ") and can_shoot:
		laser.emit(position - Vector2(0,60))
		can_shoot = false
		$laserTimer.start()
	


func _on_laser_timer_timeout():
	can_shoot = true
