class_name GameGrid
extends Resource

# Vector2 : Node
var locations : Dictionary
var tile_size : Vector2 = Vector2(16, 16)

func get_at_grid_pos(position: Vector2) -> Node:
	return locations[position] if locations.has(position) else null


func check_grid_pos(position: Vector2) -> bool:
	return locations.has(position)
