extends FroggyState

func enter(msg := {}):
	
	froggy.animtree.travel("jump_out")
	
	var target_hole = $"%hole_check".get_overlapping_areas()[0]
	var warp_hole = target_hole.get_target_pos()
	
	froggy.global_position = warp_hole
	
