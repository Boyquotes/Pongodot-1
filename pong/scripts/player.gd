extends KinematicBody2D

export var speed = 200
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -speed
	if Input.is_action_just_pressed("ui_down"):
		velocity.y = speed
	elif Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down"):
		velocity.y = 0
	move_and_collide(velocity * delta)
