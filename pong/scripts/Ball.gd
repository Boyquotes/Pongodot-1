extends Sprite

#variables
export var speed = 10
var velocity = Vector2.ZERO
#var start

# Called when the node enters the scene tree for the first time.
func _ready():
	start()

func start():
	position = Vector2.ZERO
	velocity = Vector2(rand_range(-1,1), rand_range(-1, 1)).normalized()* speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
