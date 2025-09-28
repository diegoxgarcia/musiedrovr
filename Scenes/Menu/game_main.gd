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
@onready var screenViewPortAudio: MeshInstance3D = $Environment/ViewPortAudio/Screen
@onready var screenViewPortHowTo: MeshInstance3D = $Environment/ViewPortHowTo/Screen
@onready var screenViewPortCredits: MeshInstance3D = $Environment/ViewPortCredits/Screen


func _ready():
	config_xr()
	disable_movement()
	connect_signal_buttons()
	make_screen_transparent(screenViewPortAudio)
	make_screen_transparent(screenViewPortHowTo)
	make_screen_transparent(screenViewPortCredits)
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
	
func make_screen_transparent(screen: MeshInstance3D):
	var mat := get_screen_material(screen)
	if mat == null: return
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.albedo_color.a = 0.0
	pass
	
func get_screen_material(screen: MeshInstance3D) -> BaseMaterial3D:
	var mat := screen.get_active_material(0)
	if mat == null:
		return null
	if not mat.resource_local_to_scene:
		mat = mat.duplicate()
		mat.resource_local_to_scene = true
		screen.set_surface_override_material(0, mat)
	return mat
	
func fade_in_viewport(screen: MeshInstance3D, duration: float = 1.0):
	var mat := get_screen_material(screen)
	if mat == null: return
	if mat.albedo_color.a == 1.0: fade_out_viewport(mat, 2.4)
	else:
		var t := create_tween()
		t.tween_property(mat, "albedo_color:a", 1.0, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	pass
	
func fade_out_viewport(material: BaseMaterial3D, duration: float = 1.0):
	var t := create_tween()
	t.tween_property(material, "albedo_color:a", 0.0, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	pass
	
func _on_show_start():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
	pass
	
func _on_show_credits():
	fade_in_viewport(screenViewPortCredits, 2.4)
	pass

func _on_show_how_to():
	fade_in_viewport(screenViewPortHowTo, 2.4)
	pass
	
func _on_show_test():
	animation_player.play("lights_off_fade")
	pass
	
func _on_show_audio_menu():
	fade_in_viewport(screenViewPortAudio, 2.4)
	## ver si se puede darle play a una animacion donde se mueva el viewPort
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"lights_off_fade":
			get_tree().change_scene_to_file("res://Test/main.tscn")
	pass # Replace with function body.
