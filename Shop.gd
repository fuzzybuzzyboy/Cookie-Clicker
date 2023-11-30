extends Node2D

@onready var shopmenu = get_node("Shopmenu")
@onready var upgrade1 = get_node("upgrade1")
@onready var upgrade2 = get_node("upgrade2")
@onready var upgrade3 = get_node("upgrade3")
@onready var data_reference : Data = preload("res://Data.gd").new()
var upgrade1b = false
var upgrade2b = false
var upgrade3b = false
var previous_cookies : int = 0
var value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade1.hide()
	upgrade2.hide()
	upgrade3.hide()
	shopmenu.hide()
	pass

func _on_cookies_changed(new_cookies):
	print("Cookies : ", new_cookies)
func _process(_delta):
	var current_cookies = Data.Cookies
	if current_cookies != previous_cookies:
		#print("Cookies changed in Data:", current_cookies)
		previous_cookies = current_cookies
		pass
	pass
	
func _on_shopbutton_pressed():
	if value >= 2:
		value = 0
	pass
	value += 1
	if value == 1:
		if upgrade1b == false:
			upgrade1.show()
		if upgrade2b == false:
			upgrade2.show()
		if upgrade3b == false:
			upgrade3.show()
		shopmenu.show()
	elif value == 2:
		upgrade1.hide()
		upgrade2.hide()
		upgrade3.hide()
		shopmenu.hide()
	else:
		value += 1
	#print("Shop : ", value)
	pass

func _on_upgrade_1_pressed():
	if previous_cookies > 9:
		upgrade1b = true
		upgrade1.hide()
		Data.set_cookies(Data.Cookies - 10)
		Data.set_cookies_add(Data.CookiesAdd + 4)
pass

func _on_upgrade_2_pressed():
	if previous_cookies > 99:
		if upgrade1b == true:
			Data.set_cookies_add(Data.CookiesAdd - 4)
		upgrade2b = true
		upgrade2.hide()
		Data.set_cookies(Data.Cookies - 100)
		Data.set_cookies_add(Data.CookiesAdd + 4999)
pass
	
func _on_upgrade_3_pressed():
	if previous_cookies > 499999: #9999999
		upgrade3b = true
		upgrade3.hide()
		Data.set_cookies(Data.Cookies - 500000) # 10,000,000
		Data.set_cookies_add(Data.CookiesAdd + 1000000) # 1m
