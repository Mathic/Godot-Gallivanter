# https://github.com/Oen44/Godot-Inventory

extends GridContainer
const ItemClass = preload("Item.gd")
const ItemSlotClass = preload("ItemSlot.gd")

const slotTexture = preload("res://inventory/inventory_slot.png")
const itemimg = [
	preload("res://img/tools/axe.png"), # 0
	preload("res://img/tools/bow.png"),
	preload("res://img/tools/broadsword.png"),
	preload("res://img/tools/hammer.png"),
	preload("res://img/tools/hatchet.png"),
	preload("res://img/tools/knife.png"), # 5
	preload("res://img/tools/pickaxe.png"),
	preload("res://img/tools/rod.png"),
	preload("res://img/tools/sword.png"),
	
	preload("res://img/resources/log.png"),
	preload("res://img/resources/pelt.png"), # 10
	preload("res://img/resources/rock.png"),
	
	preload("res://img/food/beaver_tail_1.png"),
	preload("res://img/food/beaver_tail_2.png"),
	preload("res://img/food/blueberry.png"),
	preload("res://img/food/bpie.png"), # 15
	preload("res://img/food/cheese.png"),
	preload("res://img/food/chocolate.png"),
	preload("res://img/food/cooked_egg.png"),
	preload("res://img/food/flapjack.png"),
	preload("res://img/food/flour.png"), # 20
	preload("res://img/food/gravy.png"),
	preload("res://img/food/meat.png"),
	preload("res://img/food/milk.png"),
	preload("res://img/food/nanaimo.png"),
	preload("res://img/food/potato.png"), #25
	preload("res://img/food/poutine.png"),
	preload("res://img/food/raw_egg.png"),
	preload("res://img/food/soup.png"),
	preload("res://img/food/spie.png"),
	preload("res://img/food/steak.png"), # 30
	preload("res://img/food/strawberry.png"),
	preload("res://img/food/syrup.png"),
	preload("res://img/food/tomato.png")
]

const itemDictionary = {
	0: {
		"itemName": "Axe",
		"itemValue": 546,
		"itemDesc": "Used to cut down trees.",
		"itemIcon": itemimg[0]
	},
	1: {
		"itemName": "Bow",
		"itemValue": 21,
		"itemDesc": "Shoot.",
		"itemIcon": itemimg[1]
	},
	2: {
		"itemName": "Broadsword",
		"itemValue": 189,
		"itemDesc": "Heavier and slower than a sword but does more damage.",
		"itemIcon": itemimg[2]
	},
	3: {
		"itemName": "Hammer",
		"itemValue": 1,
		"itemDesc": "USed to build structures.",
		"itemIcon": itemimg[3]
	},
	4: {
		"itemName": "Hatchet",
		"itemValue": 546,
		"itemDesc": "",
		"itemIcon": itemimg[4]
	},
	5: {
		"itemName": "Knife",
		"itemValue": 21,
		"itemDesc": "Used to skin animals.",
		"itemIcon": itemimg[5]
	},
	6: {
		"itemName": "Pickaxe",
		"itemValue": 189,
		"itemDesc": "Hit rocks to get smaller rocks.",
		"itemIcon": itemimg[6]
	},
	7: {
		"itemName": "Rod",
		"itemValue": 1,
		"itemDesc": "Use on water.",
		"itemIcon": itemimg[7]
	},
	8: {
		"itemName": "Sword",
		"itemValue": 546,
		"itemDesc": "Stick 'em with the pointy end.",
		"itemIcon": itemimg[8]
	},
	9: {
		"itemName": "Log",
		"itemValue": 21,
		"itemDesc": "Cut from a tree.",
		"itemIcon": itemimg[9]
	},
	10: {
		"itemName": "Pelt",
		"itemValue": 189,
		"itemDesc": "Animal skin.",
		"itemIcon": itemimg[10]
	},
	11: {
		"itemName": "Rock",
		"itemValue": 1,
		"itemDesc": "A piece of a boulder.",
		"itemIcon": itemimg[11]
	},
	12: {
		"itemName": "Cinnamon Sugar Beaver Tail",
		"itemValue": 546,
		"itemDesc": "A crunchy pastry topped with cinnamon and sugar.",
		"itemIcon": itemimg[12]
	},
	13: {
		"itemName": "Peanutbutter Nutella Beaver Tail",
		"itemValue": 21,
		"itemDesc": "Also a beaver tail but topped with peanut butter and nutella.",
		"itemIcon": itemimg[13]
	},
	14: {
		"itemName": "Blueberry",
		"itemValue": 189,
		"itemDesc": "Sweet blueberries gathered from bushes.",
		"itemIcon": itemimg[14]
	},
	15: {
		"itemName": "Blueberry Pie",
		"itemValue": 1,
		"itemDesc": "Blueberry filling, flaky crust. What more could you want?",
		"itemIcon": itemimg[15]
	},
	16: {
		"itemName": "Cheese",
		"itemValue": 546,
		"itemDesc": "Cheese.",
		"itemIcon": itemimg[16]
	},
	17: {
		"itemName": "Chocolate",
		"itemValue": 21,
		"itemDesc": "Chocolate made from sweet cocoa, milk and sugar.",
		"itemIcon": itemimg[17]
	},
	18: {
		"itemName": "Cooked Egg",
		"itemValue": 189,
		"itemDesc": "Egg cooked the way you like it.",
		"itemIcon": itemimg[18]
	},
	19: {
		"itemName": "Flapjack",
		"itemValue": 1,
		"itemDesc": "Fluffy flapjacks topped with Canadian maple syrup.",
		"itemIcon": itemimg[19]
	},
	20: {
		"itemName": "Flour",
		"itemValue": 546,
		"itemDesc": "Flour made from ground up grains.",
		"itemIcon": itemimg[20]
	},
	21: {
		"itemName": "Gravy",
		"itemValue": 21,
		"itemDesc": "Gravy. Add flavour to your fries and meat.",
		"itemIcon": itemimg[21]
	},
	22: {
		"itemName": "Meat",
		"itemValue": 189,
		"itemDesc": "Raw flesh of an animal.",
		"itemIcon": itemimg[22]
	},
	23: {
		"itemName": "Milk",
		"itemValue": 1,
		"itemDesc": "Dairy product used for making yogurt, cheese, etc.",
		"itemIcon": itemimg[23]
	},
	24: {
		"itemName": "Nanaimo Bar",
		"itemValue": 546,
		"itemDesc": "A three-layered dessert: 'a wafer and coconut crumb-base, custard flavoured butter icing in the middle and a layer of chocolate ganache on top'",
		"itemIcon": itemimg[24]
	},
	25: {
		"itemName": "Potato",
		"itemValue": 21,
		"itemDesc": "A starchy root that is versatile and can be cooked in many ways.",
		"itemIcon": itemimg[25]
	},
	26: {
		"itemName": "Poutine",
		"itemValue": 189,
		"itemDesc": "Fries, gravy and cheese curds.",
		"itemIcon": itemimg[26]
	},
	27: {
		"itemName": "Raw Egg",
		"itemValue": 1,
		"itemDesc": "Egg gathered from chickens.",
		"itemIcon": itemimg[27]
	},
	28: {
		"itemName": "Soup",
		"itemValue": 546,
		"itemDesc": "Hot tomato soup to soothe the soul.",
		"itemIcon": itemimg[28]
	},
	29: {
		"itemName": "Strawberry Pie",
		"itemValue": 21,
		"itemDesc": "Strawberry pie when you've had enough blueberry pie.",
		"itemIcon": itemimg[29]
	},
	30: {
		"itemName": "Steak",
		"itemValue": 189,
		"itemDesc": "Deliciously grilled barbecue steak.",
		"itemIcon": itemimg[30]
	},
	31: {
		"itemName": "Strawberry",
		"itemValue": 1,
		"itemDesc": "Sweet and sour strawberries.",
		"itemIcon": itemimg[31]
	},
	32: {
		"itemName": "Syrup",
		"itemValue": 1,
		"itemDesc": "Canadian maple syrup gathered from maple trees.",
		"itemIcon": itemimg[32]
	},
	33: {
		"itemName": "Tomato",
		"itemValue": 1,
		"itemDesc": "A fruit that is eaten like avegetable.",
		"itemIcon": itemimg[33]
	}
}

var slotList = Array()
var itemList = Array()

var holdingItem = null

func _ready():
	randomize()
	
	for i in range(15):
		var slot = ItemSlotClass.new(i)
		slotList.append(slot)
		add_child(slot)
	
	for i in range(3):
		var index = randi()%itemDictionary.size() + 1
		var itemName = itemDictionary[index].itemName
		var itemIcon = itemDictionary[index].itemIcon
		var itemValue = itemDictionary[index].itemValue
		var itemDesc = itemDictionary[index].itemDesc
		itemList.append(ItemClass.new(itemName, itemIcon, null, itemValue, itemDesc))
		slotList[i].setItem(itemList[i])

func _input(event):
	if holdingItem != null && holdingItem.picked:
		holdingItem.rect_global_position = Vector2(event.position.x, event.position.y)

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var clickedSlot
			
		for slot in slotList:
			var slotMousePos = slot.get_local_mouse_position()
			var slotTexture = slot.texture
			var isClicked = slotMousePos.x >= 0 && slotMousePos.x <= slotTexture.get_width() && slotMousePos.y >= 0 && slotMousePos.y <= slotTexture.get_height()
			if isClicked:
				clickedSlot = slot
		
		if clickedSlot == null:
			return
		
		if holdingItem != null:
			if clickedSlot.item != null:
				var tempItem = clickedSlot.item
				var oldSlot = slotList[slotList.find(holdingItem.itemSlot)]
				clickedSlot.pickItem()
				clickedSlot.putItem(holdingItem)
				holdingItem = null
				oldSlot.putItem(tempItem)
			else:
				clickedSlot.putItem(holdingItem)
				holdingItem = null
		elif clickedSlot.item != null:
			holdingItem = clickedSlot.item
			clickedSlot.pickItem()
			holdingItem.rect_global_position = Vector2(event.position.x, event.position.y) + Vector2(786, 395)
		