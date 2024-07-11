/datum/species/human
	name = "\improper Humanikatari"
	id = SPECIES_HUMAN
	inherent_traits = list(
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_USES_SKINTONES,
	)
	mutant_bodyparts = list("wings" = "None")
	skinned_type = /obj/item/stack/sheet/animalhide/human
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP
	payday_modifier = 0.5
/datum/species/human/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_haircolor("#597281", update = FALSE)
	human.set_hairstyle("Business Hair", update = TRUE)
	death_sound = 'sound/voice/human/human_deathsound.mp3'
/datum/species/human/randomize_features(mob/living/carbon/human/human_mob)
	human_mob.skin_tone = random_skin_tone()

/datum/species/human/get_scream_sound(mob/living/carbon/human/human)
	if(human.gender == MALE)
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(
			'sound/voice/human/malescream_1.ogg',
			'sound/voice/human/marine_die2.wav',
			'sound/voice/human/marine_pain1.wav',
			'sound/voice/human/malescream_4.ogg',
			'sound/voice/human/malescream_5.ogg',
			'sound/voice/human/marine_pain2.wav',
		)

	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/human/get_species_description()
	return list(
		" \"...Despite their weakness, Humanikatari clings to the universe, even if just barely. \
		In twisted way, they are akin to the neanderthals clinging to their territories upon an \
		ancient earth, even as their own species replaced the same niche...\"")


/datum/species/human/get_species_lore()
	return list(
		"The ancestor which all clades belong to. Founders of the galactic empire which is doomed to collapse under its own weight."
	)

/datum/species/human/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
	list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "fist-raised",
		SPECIES_PERK_NAME = "Second-class",
		SPECIES_PERK_DESC = "Humans are considered second-class citizens to the transhuman and quasihuman inhabitants of the empire. \
		Expect limitations and great trouble with certain pursuits."
	),
		list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "dna",
		SPECIES_PERK_NAME = "Weak Genes",
		SPECIES_PERK_DESC = "While still not perfectly baseline \"Humans\", \
		Humanikatari still struggles against other advanced transhuman descendants. Thus, they are weaker \
		and must rely on marrying flesh with metal to survive."
	)
)


	return to_add


