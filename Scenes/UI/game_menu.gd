class_name GameMenu
extends Control

signal show_credits
signal show_audio_menu
signal show_how_to

func _on_start_button_pressed():
	print_debug("Start")
	pass


func _on_audio_button_pressed():
	show_audio_menu.emit()
	pass


func _on_how_to_button_pressed():
	show_how_to.emit()
	pass


func _on_credit_button_pressed():
	show_credits.emit()
	pass
