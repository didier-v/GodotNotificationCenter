# GodotNotificationCenter
A notification center for [Godot Engine](https://github.com/okamstudio/godot)
(compatible with versions 1.1 and 2.0)


# Installation
Just add notification_center.gd to the autoload settings of your project

You only need the notification_center.gd script.

Check the demo project for more info.

# Usage

Notifications are sent to observers. Any object can be an observer. Notifications can be sent from anywhere in your code.

If you need to add an observer or send a notification, get the root object:

`var nc = get_node("/root/nc") # if you named it nc in the autoload settings`

## To add an object as observer
`nc.add_observer(observer,notificationName,action)`

  * observer is the object added as an observer
  * notificationName is the ID of the notification. It is a String. 
  * action is the name of a function that must be defined by the observer with 3 parameters:
  
  `func action(observer,notificationName,notificationData):`
  
  * notificationData can by of any type. You can make a dictionary and include every needed data in it. It is sent with the notification. 
  
## To remove an observer
 `nc.remove_observer(observer, notificationName)`

you MUST remove an observer, at least when it leaves the scene. Example: 

    func _exit_tree():
        nc.remove_observer(self, notificationName)

## To send a notification
`nc.post_notification(notificationName,notificationData)`

 Every observer of notificationName will execute its action.
  
# Licence
MIT
