extends Area2D

var gun
var gun_sprite
const items = ["res://items/gun.tscn", "res://items/sword.tscn"]
var item

func _ready():
	#randomize weapon obtained.
	print("Item Generated")
	item = get_child(1)
	
	#set item to visible.
	item.set_visible(true)
	#preload more items
	

func _on_body_entered(body):
	queue_free()
	print("Item Collected")
	print("Body: " + body.name)
	const collectable = preload(items[1])
	body.add_child.call_deferred(collectable.instantiate())
	
