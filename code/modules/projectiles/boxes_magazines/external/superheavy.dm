/obj/item/ammo_box/magazine/superheavy
	name = "20mm magazine"
	icon_state = "martyr"
	base_icon_state = "martyr"
	ammo_type = /obj/item/ammo_casing/huge
	max_ammo = 15
	caliber = CALIBER_20MM

/obj/item/ammo_box/magazine/superheavy/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][ammo_count() ? "-ammo" : ""]"
