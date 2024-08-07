/obj/item/ammo_box/magazine/m7mm
	name = "box magazine (7mm)"
	icon_state = "a7mm-50"
	ammo_type = /obj/item/ammo_casing/m7mm
	caliber = CALIBER_A7MM
	max_ammo = 50

/obj/item/ammo_box/magazine/m7mm/hollow
	name = "box magazine (Hollow-Point 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/hollow

/obj/item/ammo_box/magazine/m7mm/ap
	name = "box magazine (Armor Penetrating 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/ap

/obj/item/ammo_box/magazine/m7mm/incen
	name = "box magazine (Incendiary 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/incen

/obj/item/ammo_box/magazine/m7mm/match
	name = "box magazine (Match 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/match

/obj/item/ammo_box/magazine/m7mm/bouncy
	name = "box magazine (Rubber 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/bouncy

/obj/item/ammo_box/magazine/m7mm/bouncy/hicap
	name = "hi-cap box magazine (Rubber 7mm)"
	max_ammo = 150

/obj/item/ammo_box/magazine/m7mm/update_icon_state()
	. = ..()
	icon_state = "a7mm-[min(round(ammo_count(), 10), 50)]" //Min is used to prevent high capacity magazines from attempting to get sprites with larger capacities

//4.73x33mm rounds here, it's all made of MEAAATTTT

/obj/item/ammo_box/magazine/m4mm
	name = "ammunition fleshmass (4.73x33mm)"
	desc = "A spongey mass of tissue that holds caseless 4.73x33mm enamel rounds. \
	This one seems to be of the glorbo genus of fleshmags."
	icon_state = "fleshmass" // Flesh and the power it holds!!!
	base_icon_state = "fleshmass"
	custom_materials = list(/datum/material/zrbite = SHEET_MATERIAL_AMOUNT*15)
	ammo_type = /obj/item/ammo_casing/m4mm
	caliber = CALIBER_M4MM
	max_ammo = 200

/obj/item/ammo_box/magazine/m4mm/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][ammo_count() ? "-ammo" : ""]"

