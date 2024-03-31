extends Area2D

var gun
var gun_sprite
var items
var item_id = randi_range(1,5)
var item

func _ready():
	#randomize weapon obtained.
	items = [preload("res://items/sword.tscn"),preload("res://items/gun.tscn"), preload("res://items/gun2.tscn"), preload("res://items/gun3.tscn")]
	item_id = randi_range(0,3)
	item = get_child(item_id + 1)
	#set item to visible.
	item.set_visible(true)
	#preload more items
	

func _on_body_entered(body):
	queue_free()
	print("Item Collected")
	print("Body: " + body.name)
	var collectable = items[item_id]
	body.get_node("Weapons").add_child.call_deferred(collectable.instantiate())
	
