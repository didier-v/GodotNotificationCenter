
extends Node

var nc

func _ready():
	nc = get_node("/root/nc")



func _on_Button_pressed():
	var notificationData = { #  can be any type, even array or dict
		"sender":self ,
		"message":"hello"
	}
	nc.post_notification("DEMO_NOTIFICATION",notificationData)
