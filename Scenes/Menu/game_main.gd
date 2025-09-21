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
@onready var menu_control: GameMenu = view_port_main.get_scene_instance()
@onready var view_port_audio: XRToolsViewport2DIn3D = $Environment/ViewPortAudio
@onready var view_port_how_to = $Environment/ViewPortHowTo
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	config_xr()
	disable_movement()
	connect_signal_buttons()
	pass

func connect_signal_buttons():
	menu_control.show_credits.connect(_on_show_credits)
	menu_control.show_how_to.connect(_on_show_how_to)
	menu_control.show_test.connect(_on_show_test)
	menu_control.show_start.connect(_on_show_start)
	menu_control.show_audio_menu.connect(_on_show_audio_menu)
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
	
func _on_show_start():
	
	pass
	
func _on_show_credits():

	pass

func _on_show_how_to():
	view_port_how_to.visible = true
	pass
	
func _on_show_test():
	animation_player.play("lights_off_fade")
	pass
	
func _on_show_audio_menu():
	view_port_audio.visible = true
	## ver si se puede darle play a una animacion donde se mueva el viewPort
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"lights_off_fade":
			get_tree().change_scene_to_file("res://Test/main.tscn")
	pass # Replace with function body.
