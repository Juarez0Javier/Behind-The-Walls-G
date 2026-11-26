extends Control

func _on_start_bttn_pressed() -> void:
	GameManager.levelSwap("LvS")


func _on_exit_bttn_pressed() -> void:
	get_tree().quit()
