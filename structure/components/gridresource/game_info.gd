class_name GameBoard
extends Node

# Vector2 : Array[GameObject]
var objects : Dictionary
var tile_size : Vector2 = Vector2(16, 16)
var tilemap : TileMap

func update() -> void:
	for pos in objects:
		for obj in objects[pos]:
			obj.update()


func check_position(position: Vector2i, type: GameObject.ACTOR_TYPE) -> GameObject:
	if objects.has(position):
		if not objects[position].is_empty():
			for obj in objects[position]:
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

