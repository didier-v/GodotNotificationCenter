
extends Node

var nc


func _ready():
	nc = get_node("/root/nc")
	nc.add_observer(self, "DEMO_NOTIFICATION","handleNotification")


func _exit_tree():
	nc.remove_observer(self,"DEMO_NOTIFICATION")


func handleNotification(observer,notificationName,notificationData):
	set_text(notificationName)
	get_node("data").set_text(notificationData)
