class_name GameMenu
extends Control

signal show_credits

func _on_start_button_pressed():
	print_debug("Start")
	pass # Replace with function body.


func _on_audio_button_pressed():
	print_debug("Audio")
	pass # Replace with function body.


func _on_how_to_button_pressed():
	print_debug("How To")
	pass # Replace with function body.


func _on_credit_button_pressed():
	show_credits.emit()
	print_debug("Credits")
	pass # Replace with function body.
