/obj/item/clothing/under/synthrubber
	name = "bodysuit"
	desc = "A skintight bodysuit designed for cyborgs and synthetics. Very comfortable."
	icon = 'icons/mob/clothing/under/synth.dmi'
	worn_icon = 'icons/mob/clothing/under/synth.dmi'
	icon_state = "rubbersuit"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor_type = /datum/armor/clothing_under/rubber
	equip_sound = 'sound/items/equip/rubber_equip.mp3'
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'

/datum/armor/clothing_under/rubber
	melee = 10
	fire = 50
	acid = 40
	wound = 10
