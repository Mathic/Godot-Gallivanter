# https://github.com/Oen44/Godot-Inventory

extends TextureRect

var itemIcon
var itemName
var itemSlot
var itemDesc
var picked = false

func _init(itemName, itemTexture, itemSlot, itemValue, itemDesc):
	self.itemName = itemName
	self.itemDesc = itemDesc
	texture = itemTexture
	hint_tooltip = "%s\n\n%s\n\nValue: %d" % [itemName, itemDesc, itemValue]
	self.itemSlot = itemSlot
	mouse_filter = Control.MOUSE_FILTER_PASS
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	
func pickItem():
	rect_global_position = Vector2(776, 384)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	picked = true
	
func putItem():
	rect_global_position = Vector2(776, 384)
	mouse_filter = Control.MOUSE_FILTER_PASS
	picked = false