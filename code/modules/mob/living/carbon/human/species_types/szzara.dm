/datum/species/szzara
	//Reptillian transhumans whom have split into many sub-species. This is the primary one.
	name = "\improper Szzara"
	plural_form = "Szzara"
	id = SPECIES_SZZARA
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	species_language_holder = /datum/language_holder/deep
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
	species_cookie = /obj/item/food/meat/slab
	meat = /obj/item/food/meat/slab/human/mutant/lizard
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
	eye_icon = 'icons/mob/human/oversized_face.dmi'
	bodytype_override = BODYTYPE_SZZARA
	clothing_file_suffix = "szzara"
	exotic_bloodtype = "L"
	ass_image = 'icons/ass/asslizard.png'

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/szzara,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/szzara,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/szzara,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/szzara,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/szzara,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/szzara,
	)
	mutant_organs = list(
		/obj/item/organ/internal/eyes/szzara,
		/obj/item/organ/internal/stomach/szzara,
		/obj/item/organ/internal/tongue/lizard,
		/obj/item/organ/internal/heart/szzara,
	)

/datum/species/szzara/get_species_description()
	return "Incomplete..."

/datum/species/szzara/get_species_lore()
	return list(
	"These semi-aquatic reptillians... \
\
	"
)

/datum/species/szzara/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "dragon",
			SPECIES_PERK_NAME = "Paragon",
			SPECIES_PERK_DESC = "Pure flesh and raw bone shaped into a progenitor of \
			pan-szzara races, based on a common inhuman biology."
		),
	)

	return to_add

/datum/species/szzara/get_scream_sound(mob/living/carbon/human/szzara)
	return pick(
		'sound/voice/lizard/lizard_scream_1.ogg',
		'sound/voice/lizard/lizard_scream_2.ogg',
		'sound/voice/lizard/lizard_scream_3.ogg',
	)
