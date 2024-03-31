extends Area2D

var gun
var gun_sprite
var items
var item_id = randi_range(1,5)
var item

func _ready():
	#randomize weapon obtained.
	items = [preload("res://items/sword.tscn"),preload("res://items/gun.tscn"), preload("res://items/gun.tscn"), preload("res://items/gun.tscn"), preload("res://items/gun.tscn")]
	item_id = randi_range(1,5)
	item = get_child(item_id)
	#set item to visible.
	item.set_visible(true)
	#preload more items
	

func _on_body_entered(body):
	queue_free()
	print("Item Collected")
	print("Body: " + body.name)
	var collectable = items[item_id-1]
	body.get_node("Weapons").add_child.call_deferred(collectable.instantiate())
	
