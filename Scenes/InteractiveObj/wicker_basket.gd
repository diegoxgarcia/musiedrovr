extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $Node/AudioStreamPlayer3D
@onready var spot_light_3d: SpotLight3D = $SpotLight3D

var rng = RandomNumberGenerator.new()
var pickable_shape_data = PickableShapeData.new()
var key_color = rng.randi_range(0, pickable_shape_data.shape_color.size() - 1)

func _ready() -> void:
	spot_light_3d.light_color = pickable_shape_data.shape_color[key_color]
	pass

func _on_basket_pickable_detector_figure_entered(body: Variant) -> void:
	animation_player.play("figure_entered_light")
	audio_stream_player_3d.play()
	pass
