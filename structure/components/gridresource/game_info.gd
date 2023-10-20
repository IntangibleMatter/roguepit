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

func check_tile(position: Vector2i) -> int:
	var tile := tilemap.get_cell_tile_data(0, position)
	if tile:
		return tile.get_custom_data("health")
	return -1

