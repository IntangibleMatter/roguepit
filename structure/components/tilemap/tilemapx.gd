extends TileMap


func change_tile(coords: Vector2i, amount := -1) -> void:
	var id := get_cell_source_id(0, coords)
	var data : TileData = get_cell_tile_data(0, coords)
	var source_id := get_cell_source_id(0, coords)
	var health : int = data.get_custom_data("health")
	if health + amount <= 0:
		health = -1
	set_cell(0, coords, source_id)


"""
func _tile_data_runtime_update(layer: int, coords: Vector2i, tile_data: TileData) -> void:
	pass

func _use_tile_data_runtime_update(layer: int, coords: Vector2i) -> bool:
	if get_cell_source_id(layer, coords) == -1:
		return false
	return true
"""
