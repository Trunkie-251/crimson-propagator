/obj/item/clothing/mask/gas/pughood
	name = "PUG suit hood"
	desc = "A multi-lensed gasmask with a full hazmat hood. Very useful for keeping those disgusting germs out."
	icon_state = "engiborgmask"
	inhand_icon_state = "gas_atmos"
	armor_type = /datum/armor/gas_atmos
	flash_protect = FLASH_PROTECTION_WELDER
	resistance_flags = FIRE_PROOF | ACID_PROOF
	body_parts_covered = HEAD|NECK
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH | PEPPERPROOF
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDESNOUT|HIDEFACIALHAIR|HIDEHAIR
	max_filters = 4

/datum/armor/gas_atmos
	melee = 10
	bio = 100
	fire = 100
	acid = 55

//datum/armor/synthmask
	//flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDESNOUT|HIDEFACIALHAIR|HIDEHAIR
	//flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH | PEPPERPROOF
	//resistance_flags = FIRE_PROOF | ACID_PROOF
	//max_filters = 4
