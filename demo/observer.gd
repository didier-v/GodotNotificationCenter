
extends Label

var nc

func _ready():
	nc = $"/root/nc"
	nc.add_observer(self, "DEMO_NOTIFICATION","handleNotification")

func _exit_tree():
	nc.remove_observer(self,"DEMO_NOTIFICATION")

func handleNotification(observer,notificationName,notificationData):
	text = notificationName
	$"data".text = "sent by "+str(notificationData.sender)+", message: "+notificationData.message