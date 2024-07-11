/obj/item/clothing/under/syntech
	name = "Bodysuit"
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
	can_adjust = FALSE


/datum/armor/clothing_under/rubber
	melee = 10
	fire = 50
	acid = 40
	wound = 10

/obj/item/clothing/under/syntech/synthrubber
	name = "Bodysuit"
	desc = "A skintight bodysuit designed for cyborgs and synthetics. Very comfortable."
	icon_state = "rubbersuit"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/under/syntech/coveralls
	name = "Civilian coveralls"
	desc = " 'It was a town of machinery and tall chimneys, out of which interminable serpents of smoke trailed themselves and were \
	never uncoiled. It had a black canal in it, and a river that ran purple with ill-smelling dye, and vast piles of \
	building full of windows where there was a rattling and a trembling all day long, and where the piston of machinery worked \
	monotonously.' \n\
	\n\
	'It contained several large streets all very \
	like one another and many small streets still more like one another, inhabited by people equally like one another, who all went in and \
	out at the same hours with the same sound, to do the same work, and to whom every day was the same as yesterday and tomorrow, \
	and every year the counterpart of the last and the next.'"
	icon_state = "citizen"
	equip_sound = 'sound/items/equip/jumpsuit_equip.ogg'
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'
	armor_type = /datum/armor/clothing_under/coveralls

/datum/armor/clothing_under/coveralls
	melee = 10
	fire = 25
	acid = 30
	wound = 10

/obj/item/clothing/under/syntech/nanolatex
	name = "\improper Nanolatex suit"
	desc = "A suit of skntight material. Ebony in colour and smooth to the touch. \
	It acts more akin to a living fluid, than a solid."
	icon = 'icons/mob/clothing/bdsm.dmi'
	worn_icon = 'icons/mob/clothing/bdsm.dmi'
	supports_variations_flags = CLOTHING_SZZARA_VARIATION
	female_sprite_flags = FEMALE_UNIFORM_CUSTOM
	worn_icon_szzara = 'icons/mob/clothing/bdsm_szzara.dmi'
	worn_icon_szzara_female = 'icons/mob/clothing/bdsm_szzara_female.dmi'
	icon_state = "nanolatex"
	armor_type = /datum/armor/clothing_under/nanogel

/datum/armor/clothing_under/nanogel
	bullet = 10
	laser = 10
	energy = 10
	melee = 5
	fire = 25
	acid = 30
	wound = 10
