extends TileMap


func change_tile(coords: Vector2i, amount := -1) -> void:
	var id := get_cell_source_id(0, coords)
	var data : TileData = get_cell_tile_data(0, coords)
	var source_id := get_cell_source_id(0, coords)
	var health : int = data.get_custom_data("health")
	if health + amount <= 0:
		health = -1
	set_cell(0, coords, source_id)

func generate(settings) -> void:
	pass
