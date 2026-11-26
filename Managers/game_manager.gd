extends Node

var passLV1:bool = false
var passLV2:bool = false
var passLV3:bool = false
var passLV4:bool = false

var lvDic = {"LvS":"Pasillos/Pasillos", 
			"Lv1":"Nivel1/Lavanderia",
			"Lv2":"Pasillos/Pasillos",
			"Lv3":"Pasillos/Pasillos", 
			"Lv4":"Pasillos/Pasillos", 
			"LvF":"Pasillos/Pasillos" }

var player: CharacterBody3D

func _ready() -> void:
	
	if get_tree().get_nodes_in_group("Player"):
		player = get_tree().get_nodes_in_group("Player")[0]

func levelSwap(key:String):
	get_tree().call_deferred("change_scene_to_file","res://Levels/" + lvDic[key] + ".tscn")
	
	if get_tree().get_nodes_in_group("Player"):
		player = get_tree().get_nodes_in_group("Player")[0]
	pass
