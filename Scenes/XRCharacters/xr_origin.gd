class_name XRCharacter
extends XROrigin3D

@onready var movement_direct = $LeftHand/MovementDirect
@onready var movement_turn = $RightHand/MovementTurn
@onready var function_pickup_right = $RightHand/FunctionPickup
@onready var function_pickup_left = $LeftHand/FunctionPickup
@onready var movement_climb_left = $LeftHand/MovementClimb
@onready var movement_climb_rigtht = $RightHand/MovementClimb


func disable_movement():
	function_pickup_left.enabled = false
	function_pickup_right.enabled = false
	movement_direct.enabled = false
	movement_turn.enabled = false
	movement_climb_left.enabled = false
	movement_climb_rigtht.enabled = false
	pass
