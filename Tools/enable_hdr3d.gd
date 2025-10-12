@tool
extends EditorScript

func _run():
	ProjectSettings.set_setting("rendering/viewport/hdr_3d", true)
	ProjectSettings.save()
	print("HDR 3D habilitado. Reiniciá el editor para que tome efecto.")
