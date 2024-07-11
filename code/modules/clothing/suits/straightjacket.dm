/obj/item/clothing/suit/jacket/strait_jacket
	name = "straitjacket"
	desc = "A suit that completely restrains the wearer. Manufactured by Antyphun Corp." //Straight jacket is antifun
	icon_state = "strait_jacket"
	inhand_icon_state = "strait_jacket"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	equip_delay_self = 50
	strip_delay = 60
	breakouttime = 5 MINUTES

/obj/item/clothing/suit/jacket/strait_jacket/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_DANGEROUS_OBJECT, INNATE_TRAIT)

/obj/item/clothing/suit/jacket/strait_jacket/nanolatex
	name = "straitjacket"
	desc = "A skintight straitjacket made from a rubbery, shiny material. " //strait-jacket is fun~!
	icon = 'icons/obj/clothing/bdsm.dmi'
	worn_icon = 'icons/mob/clothing/bdsm.dmi'
	icon_state = "straitjacket"
	inhand_icon_state = "straitjacket"
	body_parts_covered = CHEST|GROIN|ARMS|HANDS
	flags_inv = null
	equip_delay_self = 50
	strip_delay = 60
	breakouttime = 8 MINUTES
