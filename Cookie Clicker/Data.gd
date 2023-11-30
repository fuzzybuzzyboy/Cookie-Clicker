extends Node

@export var CookiesAdd : int = 1
@export var Cookies : int = 0
signal cookies_changed
signal cookies_add_changed

func _ready():
	pass
func _process(_delta):
	pass
	
func set_cookies(value):
	Cookies = value
	_on_cookies_changed(Cookies)

func set_cookies_add(value):
	CookiesAdd = value
	emit_signal("cookies_add_changed", CookiesAdd)
	#print("Updated CookiesAdd:", CookiesAdd)

func _on_cookies_changed(new_cookies):
	emit_signal("cookies_changed", new_cookies)
