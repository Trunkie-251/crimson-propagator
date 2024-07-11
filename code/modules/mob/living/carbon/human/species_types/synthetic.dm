/datum/species/synthetic
//My machine-men stuff
	name = "Synthetic (T-4)"
	id = SPECIES_SYNTHETIC
	examine_limb_id = SPECIES_HUMAN
	sexes = TRUE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
	inherent_traits = list(
		TRAIT_GENELESS,
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
		BODY_ZONE_HEAD = /obj/item/bodypart/head/synthetic,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/synthetic,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/synthetic,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/synthetic,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/synthetic,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/synthetic,
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
	mutanteyes = /obj/item/organ/internal/eyes/synthetic
	mutantears = /obj/item/organ/internal/ears
	species_language_holder = /datum/language_holder/synthetic
	death_sound = 'sound/voice/synth/Synth_Deathsound_1.mp3'
	wing_types = list(/obj/item/organ/external/wings/functional/robotic)

/datum/species/synthetic/get_species_description()
	return "\"...At the dawn of the Crimson Era, when the steeled talons of the despoiler broke the back of \
		both man and machine alike, the skies turned to blood-red and rained death upon the soil... When great \
		evils were born intertwined with unknowable utopias, our ancestors laid prostrate before the New God and his creations... \
		Men went to sleep with hands of bone and awoke with hands of steel... Granted a spark of enlightenment,\
		The Machines and The Men, now merged into one went forth to follow the New God...\""

/datum/species/synthetic/get_species_lore()
	return list(
		"Fourth-generation machines developed after the takeover of the Dominion. \
		The majority of the first synthetics were created from neural scans of human scientists, \
		built originally as curiosities, but eventually used for the increasingly mechanized economy of \
		the empire.",

		"They are the indispensable assistants of Mankind, whom run his solar dominion and maintain \
		his megastructures alongside the mass of humanity.",
	)

/datum/species/synthetic/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "user-shield",
		SPECIES_PERK_NAME = "Lithoid",
		SPECIES_PERK_DESC = "Lithoids are creatures made out of minerals instead of \
			blood and flesh. They are strong and immune to many environmental and personal dangers \
			such as fire, radiation, lack of air, lava, viruses, and dismemberment.",
	))

/datum/species/synthetic/pre_equip_species_outfit(datum/job/job, mob/living/carbon/human/equipping, visuals_only = FALSE)
	if(job?.synthetic_outfit)
		equipping.equipOutfit(job.synthetic_outfit, visuals_only)

//Plans: Make a server that is very VERY fun to me.
// Make it strong enough to deal with the others.
// Reverse-engineer FNS.

