class_name GameBoard
extends Node

# Vector2 : Array[GameObject]
var objects : Dictionary
var tile_size : Vector2 = Vector2(16, 16)
var tiles : PackedInt32Array

func check_tile(position: Vector2i) -> int:
	return 0

