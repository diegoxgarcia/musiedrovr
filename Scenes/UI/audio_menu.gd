class_name AudioMenu
extends Control

@onready var v_box_container = $VBoxContainer

const MUSIC_BUS = "Music"
const MASTER_BUS = "Master"
const SFX_BUS = "SFX"

func _ready():
	load_volume(v_box_container)
	pass

func load_volume(audio_container : VBoxContainer):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(MUSIC_BUS), GameManager.game_data.music_volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(SFX_BUS), GameManager.game_data.sfx_volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(MASTER_BUS), GameManager.game_data.master_volume)
	audio_container.get_node("MasterAudioSlider").value = GameManager.game_data.master_volume
	audio_container.get_node("MusicAudioSlider").value = GameManager.game_data.music_volume
	audio_container.get_node("SFXAudioSlider").value = GameManager.game_data.sfx_volume
	pass

func _on_master_audio_slider_value_changed(value):
	on_volume_changed(value, MASTER_BUS)
	pass # Replace with function body.

func _on_music_audio_slider_value_changed(value):
	on_volume_changed(value, MUSIC_BUS)
	pass # Replace with function body.

func _on_sfx_audio_slider_value_changed(value):
	on_volume_changed(value, SFX_BUS)
	pass # Replace with function body.

func on_volume_changed(value: float, bus: String):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), value)
	match bus:
		MASTER_BUS:
			GameManager.game_data.master_volume = value
		MUSIC_BUS:
			GameManager.game_data.music_volume = value
		SFX_BUS:
			GameManager.game_data.sfx_volume = value
	pass
