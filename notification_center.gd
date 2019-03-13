extends Node

var notifications

func _ready():
	notifications = {};

func post_notification(notificationName,notificationData):
	if notifications.has(notificationName):
		var currentObservers=notifications[notificationName].observers
		for i in currentObservers:
			var anObserver =  currentObservers[i]
			if anObserver.object.has_method(anObserver.action):
				anObserver.object.call(anObserver.action,anObserver.object,notificationName,notificationData)

func add_observer(observer,notificationName,action):
	if not notifications.has(notificationName):
		notifications[notificationName]={
			"observers":{}
		}
	var currentObservers=notifications[notificationName].observers
	currentObservers[observer.get_instance_id()]={
		"object":observer,
		"action":action
	}

func remove_observer(observer, notificationName):
	if notifications.has(notificationName):
		var currentObservers=notifications[notificationName].observers
		if currentObservers.has(observer.get_instance_id()):
			currentObservers.erase(observer.get_instance_id())

