extends Node3D

@export var lv1Blockade: Node3D
@export var lv2Blockade: Node3D
@export var lv3Blockade: Node3D
@export var lv4Blockade: Node3D

@export var lv2Portal: Node3D
@export var lv3Portal: Node3D
@export var lv4Portal: Node3D
@export var lvFPortal: Node3D

func _ready() -> void:
	
	if GameManager.passLV4:
		blockLv4()
		openLvF()
	elif GameManager.passLV3:
		blockLv3()
		openLv4()
	elif GameManager.passLV2:
		blockLv2()
		openLv3()
	elif GameManager.passLV1:
		blockLv1()
		openLv2()
	pass
	
func _physics_process(_delta:float) -> void:
	pass

func blockLv1():
	#enable_block1()
	pass	

func openLv2():
	#target door change to Portal function. But only the correct ones.
	pass

func blockLv2():
	#target door change to Block state.
	pass	

func openLv3():
	#enable_portal_3()
	pass

func blockLv3():
	#enable_block_3()
	pass	

func openLv4():
	#elevetor.change to Enable state.
	pass

func blockLv4():
	#elevetor.change to Block state.
	pass	

func openLvF():
	#enable_portal_F()
	pass
