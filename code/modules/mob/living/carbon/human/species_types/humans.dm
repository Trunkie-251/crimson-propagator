/datum/species/human
	name = "\improper Human"
	id = SPECIES_HUMAN
	inherent_traits = list(
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_USES_SKINTONES,
	)
	mutant_bodyparts = list("wings" = "None")
	skinned_type = /obj/item/stack/sheet/animalhide/human
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1.1

/datum/species/human/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_haircolor("#bb9966", update = FALSE) // brown
	human.set_hairstyle("Business Hair", update = TRUE)

/datum/species/human/randomize_features(mob/living/carbon/human/human_mob)
	human_mob.skin_tone = random_skin_tone()

/datum/species/human/get_scream_sound(mob/living/carbon/human/human)
	if(human.gender == MALE)
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(
			'sound/voice/human/malescream_1.ogg',
			'sound/voice/human/malescream_2.ogg',
			'sound/voice/human/malescream_3.ogg',
			'sound/voice/human/malescream_4.ogg',
			'sound/voice/human/malescream_5.ogg',
			'sound/voice/human/malescream_6.ogg',
		)

	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/human/get_species_description()
	return "Incredibly violent sexual mammals from earth. The only known \
		sapient race, their kind is the basis of all races, whether being creations or as \
		various subspecies of human."

/datum/species/human/get_species_lore()
	return list(
		"I'm ahead, I'm a man I'm the first mammal to wear pants, yeah! I'm at peace with my lust, \
		I can kill cause in God I trust, yeah. It's evolution, baby!",

		"I'm at peace, I'm the man. Buying stocks on the day of the crash. On the loose, I'm a truck \
		All the rolling hills, I'll flatten 'em out, yeah. It's herd behavior, uh huh. It's evolution, baby!",

		"Admire me, admire my home, Admire my son, he's my clone. Yeah, yeah, yeah, yeah. This land is mine, this land is free. \
		I'll do what I want but irresponsibly. It's evolution, baby!",

		"I'm a thief, I'm a liar, There's my church, I sing in the choir: (Hallelujah, hallelujah)",

		"Admire me, admire my home, Admire my son, admire my clones 'Cause we know, appetite for a nightly feast, \
		Those ignorant Indians got nothin' on me Nothin', why? Because... It's evolution, baby!",

		"I am ahead, I am advanced, I am the first mammal to make plans, yeah. I crawled the earth, but now I'm higher, \
		2010, watch it go to fire. It's evolution, baby, It's evolution, baby!",

		"Do the evolution!",

		"Come on,",

		"Come on,",

		"Come on...",
	)

/datum/species/human/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = "robot",
		SPECIES_PERK_NAME = "Asimov Superiority",
		SPECIES_PERK_DESC = "The Machines of the Solar dominion are required to protect \
				and serve humans. This does however mean that you are completely exempt from any \
				potentially hazardous physical activities."
	))

	if(CONFIG_GET(flag/enforce_human_authority))
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "bullhorn",
			SPECIES_PERK_NAME = "Chain of Command",
			SPECIES_PERK_DESC = "Nanotrasen only recognizes humans for command roles, such as Captain.",
		))

	return to_add

