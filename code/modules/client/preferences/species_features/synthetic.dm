/datum/preference/color/exoskeleton_color
	abstract_type = /datum/preference/color/exoskeleton_color
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	var/organ_slot

/datum/preference/color/exoskeleton_color/apply_to_human(mob/living/carbon/human/target, value)
	var/obj/item/organ/internal/exoskeleton/exoskeleton = target.get_organ_slot(organ_slot)
	if(!exoskeleton)
		return
	exoskeleton.exoskeleton.draw_color = value
	target.update_body(TRUE)

/datum/preference/color/exoskeleton_color/create_default_value()
	return random_color()

/datum/preference/color/exoskeleton_color/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	return ispath(species_type, /datum/species/synthetic)

/datum/preference/color/exoskeleton_color/head
	abstract_type = /datum/preference/color/exoskeleton_color
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	organ_slot = ORGAN_SLOT_EXOSKELETON_HEAD
	savefile_key = "exoskeleton_head_color"

/datum/preference/color/exoskeleton_color/chest
	abstract_type = /datum/preference/color/exoskeleton_color
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	organ_slot = ORGAN_SLOT_EXOSKELETON_CHEST
	savefile_key = "exoskeleton_chest_color"

/datum/preference/color/exoskeleton_color/l_arm
	abstract_type = /datum/preference/color/exoskeleton_color
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	organ_slot = ORGAN_SLOT_EXOSKELETON_L_ARM
	savefile_key = "exoskeleton_l_arm_color"

/datum/preference/color/exoskeleton_color/r_arm
	abstract_type = /datum/preference/color/exoskeleton_color
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	organ_slot = ORGAN_SLOT_EXOSKELETON_R_ARM
	savefile_key = "exoskeleton_r_arm_color"

/datum/preference/color/exoskeleton_color/l_leg
	abstract_type = /datum/preference/color/exoskeleton_color
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	organ_slot = ORGAN_SLOT_EXOSKELETON_L_LEG
	savefile_key = "exoskeleton_l_leg_color"

/datum/preference/color/exoskeleton_color/r_leg
	abstract_type = /datum/preference/color/exoskeleton_color
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	organ_slot = ORGAN_SLOT_EXOSKELETON_R_LEG
	savefile_key = "exoskeleton_r_leg_color"
