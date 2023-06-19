extends KinematicBody2D

# Declare member variables here. Examples:
export var speed = 200
var velocity = Vector2.ZERO
var angle = 45

# Called when the node enters the scene tree for the first time.
func _ready():
		start()

func start():
	position = Vector2.ZERO
	velocity = Vector2(rand_range(-1,1), rand_range(-1,1)). normalized() * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(velocity * delta)

func reset():
	position = Vector2.ZERO
	velocity = Vector2.ZERO
	start()

func _on_Area2D_body_exited(body):
	reset()

func _on_Area2D_body_entered(body):
	print("touched player")
	velocity = velocity * -1

func _on_bouncyAreaUpEnemy_body_entered(body):
	print("touched wall up enemy")
	var bounceAngle = deg2rad(-330)
	var direction = Vector2(cos(bounceAngle), sin(bounceAngle))
	velocity = direction * speed


func _on_bouncyAreaDownEnemy_body_entered(body):
	print("touched wall down enemy")
	var bounceAngle = deg2rad(30)
	var direction = Vector2(cos(bounceAngle), sin(bounceAngle))
	velocity = direction * speed

func _on_bouncyAreaDownPlayer_body_entered(body):
	print("touched wall down player")
	var bounceAngle = deg2rad(30)
	var direction = Vector2(cos(bounceAngle), sin(bounceAngle))
	velocity = direction * speed


func _on_bouncyAreaUpPlayer_body_entered(body):
	print("touched wall up player")
	var bounceAngle = deg2rad(-210)
	var direction = Vector2(cos(bounceAngle), sin(bounceAngle))
	velocity = direction * speed

#func _on_bouncyAreaUp_body_entered(body):
	#print("touched wall")
	#var bounceAngle = deg2rad(-330)
	#var direction = Vector2(cos(bounceAngle), sin(bounceAngle))
	#velocity = direction * speed
#func _on_bouncyArea_body_entered(body):
#	print("touched wall")
#	var bounceAngle = deg2rad(-30)
#	var direction = Vector2(cos(bounceAngle), sin(bounceAngle))
#	velocity = direction * speed
