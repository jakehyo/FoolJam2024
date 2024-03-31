extends Area2D

var travelled_distance = 0

var SPEED = 1000.0
var RANGE = 1200.0
var OFFSET = 0.0
var DAMAGE = 1
var PIERCE = 0
@onready var direction = Vector2.RIGHT.rotated(rotation)

func _physics_process(delta):
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	if PIERCE > 0:
		PIERCE -= 1
	else:
		queue_free()
	if body.has_method("take_damage"):
		body.take_damage(DAMAGE)
