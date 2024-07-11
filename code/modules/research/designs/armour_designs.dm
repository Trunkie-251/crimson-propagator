//////////////////
//Armour designs//
/////////////////

//This is where armour designs of stuff like flak, riot, and carapace suits go. Powersuits are their own thing.area

////////////
//Carapace//
///////////

//M24 carapace armour//

/datum/design/carapace_helmet
	name = "M24 Carapace Helmet"
	desc = "A cheaply-produced plasitisteel helmet manufactured for the fighting forces of the empire. The design has \
		not much in the past 90 years. This specific template has no visor."
	id = "carapace_helmet"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/plasma =SMALL_MATERIAL_AMOUNT*6)
	build_path = /obj/item/clothing/head/helmet/carapace
	category = list(
		RND_CATEGORY_ARMOUR + RND_CATEGORY_ARMOUR_CARAPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/carapace_helmet/visor
	name = "M24 Carapace Helmet (Felix-Pattern)"
	desc = "A cheaply-produced plasitisteel helmet manufactured for the fighting forces of the empire. The design has \
		not much in the past 90 years. This specific template has a proper visor and thusly, flash protection."
	id = "carapace_helmetvisor"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/plasma =SMALL_MATERIAL_AMOUNT * 8, /datum/material/glass =SMALL_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/clothing/head/helmet/carapace/visor
	category = list(
		RND_CATEGORY_ARMOUR + RND_CATEGORY_ARMOUR_CARAPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/carapace_armour
	name = "M24 Carapace Vest (Felix-Pattern)"
	desc = "A heavy suit of armour that slows down movement. Large plastisteel plates woven with neo-vein armour fabrics and \
	coated in rubbery synthmyomers. This imperial army variation is typically seen on heavy weapon crews or assault units."
	id = "carapace_armour"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 5, /datum/material/plasma =SHEET_MATERIAL_AMOUNT * 1.5)
	build_path = /obj/item/clothing/suit/armor/vest/carapace
	category = list(
		RND_CATEGORY_ARMOUR + RND_CATEGORY_ARMOUR_CARAPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE


/datum/design/carapace_gauntlets
	name = "M24 Carapace Gauntlets (Felix-Pattern)"
	desc = "Hi-tech gauntlets filled with dozens of hyperpenetrative micro-needles that penetrate into the skin and infuse blood \
	with small amounts of marrow-based stims. Allows for tactical tackles on demand. The plastisteel is stamped with the triple-headed hydra of the emperor."
	build_type = PROTOLATHE | AWAY_LATHE
	id = "carapace_gauntlets"
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 3, /datum/material/plasma =SHEET_MATERIAL_AMOUNT * 0.5, /datum/material/silver =SHEET_MATERIAL_AMOUNT * 1.8)
	build_path = /obj/item/clothing/gloves/carapace
	category = list(
		RND_CATEGORY_ARMOUR + RND_CATEGORY_ARMOUR_CARAPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/carapace_boots
	name = "M24 Carapace Boots (Felix-Pattern)"
	desc = "Heavily reinforced armored boots with synthrubber soles. Trenches, mud, and blood do not stop these well-armoured boots in any way."
	build_type = PROTOLATHE | AWAY_LATHE
	id = "carapace_boots"
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 3.4, /datum/material/plasma =SHEET_MATERIAL_AMOUNT * 0.6,)
	build_path = /obj/item/clothing/shoes/combat/carapace
	category = list(
		RND_CATEGORY_ARMOUR + RND_CATEGORY_ARMOUR_CARAPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE

//Plate

//Flak
