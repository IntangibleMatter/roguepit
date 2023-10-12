class_name MoveState
extends State

func move(target: Vector2) -> void:
	if not owner.game_board.check_grid_position(target):
		pass
	
	var tween := get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
