extends Node2D

signal cookies_changed

func _ready():
	$CanvasLayer/Cookie/CookieCount.text = str(Data.Cookies)
	pass
func _process(_delta):
	pass

func _on_cookie_pressed():
	Data.set_cookies(Data.Cookies + Data.CookiesAdd)
	$CanvasLayer/Cookie/CookieCount.text = str(Data.Cookies)
	pass
