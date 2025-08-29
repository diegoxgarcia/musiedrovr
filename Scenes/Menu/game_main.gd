extends XRMainNode

@onready var xr_origin_3d: XROrigin3D = $XROrigin3D
@onready var movement_direct: XRToolsMovementDirect = $XROrigin3D/LeftHand/MovementDirect
@onready var movement_turn: XRToolsMovementTurn = $XROrigin3D/RightHand/MovementTurn
@onready var function_pickup_left: XRToolsFunctionPickup = $XROrigin3D/LeftHand/FunctionPickup
@onready var function_pickup_right: XRToolsFunctionPickup = $XROrigin3D/RightHand/FunctionPickup
@onready var movement_jump: XRToolsMovementJump = $XROrigin3D/RightHand/MovementJump
@onready var movement_climb_left: XRToolsMovementClimb = $XROrigin3D/LeftHand/MovementClimb
@onready var movement_climb_right: XRToolsMovementClimb = $XROrigin3D/RightHand/MovementClimb
@onready var view_port_main: XRToolsViewport2DIn3D = $Environment/ViewPortMain
@onready var menu_control = view_port_main.get_scene_instance()
@onready var view_port_credits: XRToolsViewport2DIn3D = $Environment/ViewPortCredits

func _ready():
	config_xr()
	disable_movement()
	connect_signal_buttons()
	pass

func connect_signal_buttons():
	menu_control.show_credits.connect(_on_show_credits)
	pass

func disable_movement():
	function_pickup_left.enabled = false
	function_pickup_right.enabled = false
	movement_direct.enabled = false
	movement_turn.enabled = false
	movement_jump.enabled = false
	movement_climb_left.enabled = false
	movement_climb_right.enabled = false
	pass
	
func _on_show_credits():
	view_port_credits.visible = true
	pass
	
