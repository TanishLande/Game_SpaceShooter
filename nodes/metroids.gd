extends Area2D

var speed: int 
var direction: float
var rotate: int

signal collision

func _ready():
	#getting random number 
	var rng := RandomNumberGenerator.new()
	
	var width := 1280
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-150,-50)
	position = Vector2(random_x,random_y)
	
	speed = rng.randi_range(200,500)
	direction = rng.randf_range(-1,1)
	rotate = rng.randi_range(40,100)
	
func _process(delta):
	
	position +=  Vector2(direction,1.0) * speed * delta
	rotation_degrees += rotate*delta
	


func _on_body_entered(body):
	collision.emit()



