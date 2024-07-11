/datum/species/rook
	name = "Rook (T-5)"
	id = SPECIES_ROOK
	examine_limb_id = SPECIES_HUMAN
	sexes = FALSE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN

	inherent_traits = list(
		TRAIT_GENELESS,
		TRAIT_NODISMEMBER,
		TRAIT_NOFIRE,
		TRAIT_RADIMMUNE,
		TRAIT_NOBREATH,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_TOXIMMUNE,
		TRAIT_LIVERLESS_METABOLISM,
		TRAIT_NOBLOOD,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NO_TRANSFORMATION_STING,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHEAT,
		TRAIT_NOCLONELOSS,
		TRAIT_LIGHT_STEP,
	)

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/synthetic/rook,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/synthetic/rook,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/synthetic/rook,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/synthetic/rook,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/synthetic/rook,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/synthetic/rook,
	)

	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	meat = null //Synthetics don't have an edible meat type. Not yet anyway.
	mutanttongue = /obj/item/organ/internal/tongue/synthetic //Note that synthetic organs work inherently different from organic ones.
	mutantstomach = /obj/item/organ/internal/stomach/synthetic
	mutantappendix = null
	mutantheart = /obj/item/organ/internal/heart/synthetic
	mutantliver = /obj/item/organ/internal/liver/synthetic
	mutantlungs = null
	mutant_organs = list()
	mutantbrain = /obj/item/organ/internal/brain/positronic
	mutanteyes = /obj/item/organ/internal/eyes/synthetic/rook
	mutantears = /obj/item/organ/internal/ears
	species_language_holder = /datum/language_holder/synthetic
	wing_types = list(/obj/item/organ/external/wings/functional/robotic)


/datum/species/rook/get_species_description()
	return "A powerful machine designed for both labour and warfare. Their tall stature and thick synthetic \
	musculature makes them terrifying opponents and valued allies."

/datum/species/rook/get_species_lore()
	return list(
		"Towers of rippling synthetic muscle and alloyed bone, these gigantic synths were created fill \
		a much larger niche in the Dominion's forces. "
	)

/datum/species/synthetic/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = "user-shield",
		SPECIES_PERK_NAME = "Lithoid",
		SPECIES_PERK_DESC = "Lithoids are creatures made out of minerals instead of \
			blood and flesh. They are strong and immune to many environmental and personal dangers \
			such as fire, radiation, lack of air, lava, viruses, and dismemberment.",
	))

