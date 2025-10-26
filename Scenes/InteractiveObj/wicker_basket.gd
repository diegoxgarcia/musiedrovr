extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $Node/AudioStreamPlayer3D

func _on_basket_pickable_detector_figure_entered(body: Variant) -> void:
	animation_player.play("figure_entered_light")
	audio_stream_player_3d.play()
	pass
