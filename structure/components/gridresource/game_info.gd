class_name GameBoard
extends Node

# Vector2 : Array[GameObject]
var objects : Dictionary

var updated_objects : Dictionary

var updating : bool = false

var tile_size : Vector2 = Vector2(16, 16)
var tilemap : TileMap

func update() -> void:
	updating = true
	updated_objects = objects.duplicate(true)
	for pos in objects:
		for obj in objects[pos]:
			obj.update()
	objects = updated_objects
	updated_objects = Dictionary()
	updating = false


func brute_find_object(object: GameObject) -> Vector2i:
	if objects.has(object.position):
		if objects[object.position].has(object):
			return objects.position
	for pos in objects:
		for obj in pos:
			if obj == object:
				return pos
	# if you can't find it, panic and say it's at (0,0)
	return Vector2i.ZERO


func check_position(position: Vector2i, type: GameObjectResource.ACTOR_TYPE) -> GameObject:
	# is this weird? yes. But because dicts are passed by reference I don't have to write all the code twice.
	var checking_dict : Dictionary = updated_objects if updating else objects
	if checking_dict.has(position):
		if not checking_dict[position].is_empty():
			for obj in checking_dict[position]:
				if obj.type == type:
					return obj
	return null


func clean_empty_tiles() -> void:
	for tile in objects:
		if objects[tile].is_empty():
			objects.erase(tile)


func check_tile(position: Vector2i) -> int:
	var tile := tilemap.get_cell_tile_data(0, position)
	if tile:
		return tile.get_custom_data("health")
	return -1


func change_tile() -> void:
	pass

func move_object(object: GameObject, start: Vector2i, target: Vector2i) -> bool:
	var checking_dict : Dictionary = updated_objects if updating else objects
	if not checking_dict.has(start):
		return false
	if checking_dict[start].has(object):
		if checking_dict.has(target):
			if check_position(target, object.type) == null:
				checking_dict[target].append(object)
				checking_dict[start].remove(checking_dict[start].find(object))
				object.position = target
			else:
				return false
		else:
			checking_dict[target] = [object]
			checking_dict[start].remove(checking_dict[start].find(object))
			object.position = target
		return true
	return false

func spawn_object(object: GameObjectResource, position : Vector2i) -> void:
	var virtual : GameObjectVirtual
	var manager : GameObject = GameObject.new()

	if object.scene_override != null:
		var vhold := object.scene.instantiate()
		if vhold is GameObjectVirtual:
			virtual = vhold
		else:
			push_error("ERROR: Can't create object for resource {}. Scene is not GameObjectVirtual. Creating dummy instead.".format(object))
	manager.create(object, virtual)
