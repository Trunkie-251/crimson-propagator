//Subtype of human
/datum/species/human/felinid
	name = "Felinid"
	id = SPECIES_FELINE
	examine_limb_id = SPECIES_HUMAN
	mutant_bodyparts = list("ears" = "Cat", "wings" = "None")
	mutanttongue = /obj/item/organ/internal/tongue/cat
	mutantears = /obj/item/organ/internal/ears/cat
	external_organs = list(
		/obj/item/organ/external/tail/cat = "Cat",
	)
	inherent_traits = list(
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_HATED_BY_DOGS,
		TRAIT_EMPATH,
		TRAIT_MUTANT_COLORS,
		TRAIT_NOFAT,
		TRAIT_PRIMITIVE
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/felinid
	payday_modifier = 1.0
	ass_image = 'icons/ass/asscat.png'
	family_heirlooms = list(/obj/item/toy/cattoy)
	/// When false, this is a felinid created by mass-purrbation
	var/original_felinid = TRUE
	/// Brain size for scaling
	var/brain_size = 0.8

// Prevents felinids from taking toxin damage from carpotoxin
/datum/species/human/felinid/handle_chemical(datum/reagent/chem, mob/living/carbon/human/affected, seconds_per_tick, times_fired)
	. = ..()
	if(. & COMSIG_MOB_STOP_REAGENT_CHECK)
		return
	if(istype(chem, /datum/reagent/toxin/carpotoxin))
		var/datum/reagent/toxin/carpotoxin/fish = chem
		fish.toxpwr = 0

/datum/species/human/felinid/on_species_gain(mob/living/carbon/carbon_being, datum/species/old_species, pref_load)
	if(ishuman(carbon_being))
		var/mob/living/carbon/human/target_human = carbon_being
		if(!pref_load) //Hah! They got forcefully purrbation'd. Force default felinid parts on them if they have no mutant parts in those areas!
			target_human.dna.features["tail_cat"] = "Cat"
			if(target_human.dna.features["ears"] == "None")
				target_human.dna.features["ears"] = "Cat"
		if(target_human.dna.features["ears"] == "Cat")
			var/obj/item/organ/internal/ears/cat/ears = new
			ears.Insert(target_human, drop_if_replaced = FALSE)
		else
			mutantears = /obj/item/organ/internal/ears
		var/obj/item/organ/internal/brain/current_brain = target_human.get_organ_by_type(/obj/item/organ/internal/brain)
		if(current_brain)
			current_brain.transform = current_brain.transform.Scale(brain_size) //smaller brain
	return ..()

/datum/species/human/felinid/on_species_loss(mob/living/carbon/former_feline, datum/species/old_species, pref_load)
	if(iscarbon(former_feline))
		var/obj/item/organ/internal/brain/current_brain = former_feline.get_organ_by_type(/obj/item/organ/internal/brain)
		if(current_brain)
			current_brain.transform = current_brain.transform.Scale(1 / brain_size) //bigger brain
	return ..()

/datum/species/human/felinid/randomize_features(mob/living/carbon/human/human_mob)
	randomize_external_organs(human_mob)
	return ..()

/proc/mass_purrbation()
	for(var/mob in GLOB.human_list)
		purrbation_apply(mob)
		CHECK_TICK

/proc/mass_remove_purrbation()
	for(var/mob in GLOB.human_list)
		purrbation_remove(mob)
		CHECK_TICK

/proc/purrbation_toggle(mob/living/carbon/human/target_human, silent = FALSE)
	if(!ishuman(target_human))
		return
	if(!istype(target_human.get_organ_slot(ORGAN_SLOT_EARS), /obj/item/organ/internal/ears/cat))
		purrbation_apply(target_human, silent = silent)
		. = TRUE
	else
		purrbation_remove(target_human, silent = silent)
		. = FALSE

/proc/purrbation_apply(mob/living/carbon/human/soon_to_be_felinid, silent = FALSE)
	if(!ishuman(soon_to_be_felinid) || isfelinid(soon_to_be_felinid))
		return
	if(ishumanbasic(soon_to_be_felinid))
		soon_to_be_felinid.set_species(/datum/species/human/felinid)
		var/datum/species/human/felinid/cat_species = soon_to_be_felinid.dna.species
		cat_species.original_felinid = FALSE
	else
		var/obj/item/organ/internal/ears/cat/kitty_ears = new
		var/obj/item/organ/external/tail/cat/kitty_tail = new

		// This removes the spines if they exist
		var/obj/item/organ/external/spines/current_spines = soon_to_be_felinid.get_organ_slot(ORGAN_SLOT_EXTERNAL_SPINES)
		if(current_spines)
			current_spines.Remove(soon_to_be_felinid, special = TRUE)
			qdel(current_spines)

		// Without this line the tails would be invisible. This is because cat tail and ears default to None.
		// Humans get converted directly to felinids, and the key is handled in on_species_gain.
		// Now when we get mob.dna.features[feature_key], it returns None, which is why the tail is invisible.
		// stored_feature_id is only set once (the first time an organ is inserted), so this should be safe.
		kitty_ears.Insert(soon_to_be_felinid, special = TRUE, drop_if_replaced = FALSE)
		kitty_tail.Insert(soon_to_be_felinid, special = TRUE, drop_if_replaced = FALSE)
	if(!silent)
		to_chat(soon_to_be_felinid, span_boldnotice("Something is nya~t right."))
		playsound(get_turf(soon_to_be_felinid), 'sound/effects/meow1.ogg', 50, TRUE, -1)

/proc/purrbation_remove(mob/living/carbon/human/purrbated_human, silent = FALSE)
	if(isfelinid(purrbated_human))
		var/datum/species/human/felinid/cat_species = purrbated_human.dna.species
		if(cat_species.original_felinid)
			return // Don't display the to_chat message
		purrbated_human.set_species(/datum/species/human)
	else if(ishuman(purrbated_human) && !ishumanbasic(purrbated_human))
		var/datum/species/target_species = purrbated_human.dna.species

		// From the previous check we know they're not a felinid, therefore removing cat ears and tail is safe
		var/obj/item/organ/external/tail/old_tail = purrbated_human.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)
		if(istype(old_tail, /obj/item/organ/external/tail/cat))
			old_tail.Remove(purrbated_human, special = TRUE)
			qdel(old_tail)
			// Locate does not work on assoc lists, so we do it by hand
			for(var/external_organ in target_species.external_organs)
				if(ispath(external_organ, /obj/item/organ/external/tail))
					var/obj/item/organ/external/tail/new_tail = new external_organ()
					new_tail.Insert(purrbated_human, special = TRUE, drop_if_replaced = FALSE)
				// Don't forget the spines we removed earlier
				else if(ispath(external_organ, /obj/item/organ/external/spines))
					var/obj/item/organ/external/spines/new_spines = new external_organ()
					new_spines.Insert(purrbated_human, special = TRUE, drop_if_replaced = FALSE)

		var/obj/item/organ/internal/ears/old_ears = purrbated_human.get_organ_slot(ORGAN_SLOT_EARS)
		if(istype(old_ears, /obj/item/organ/internal/ears/cat))
			var/obj/item/organ/new_ears = new target_species.mutantears()
			new_ears.Insert(purrbated_human, special = TRUE, drop_if_replaced = FALSE)
	if(!silent)
		to_chat(purrbated_human, span_boldnotice("You are no longer a cat."))

/datum/species/human/felinid/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	human_for_preview.set_haircolor("#ffcccc", update = FALSE) // pink
	human_for_preview.set_hairstyle("Hime Cut", update = TRUE)

	var/obj/item/organ/internal/ears/cat/cat_ears = human_for_preview.get_organ_by_type(/obj/item/organ/internal/ears/cat)
	if (cat_ears)
		cat_ears.color = human_for_preview.hair_color
		human_for_preview.update_body()

/datum/species/human/felinid/get_species_description()
	return "Felinids are one of the many types of bespoke genetic \
		modifications to come of humanity's lust brought to fruition by \
		genetic sciences."

/datum/species/human/felinid/get_species_lore()
	return list(
		"Bio-engineering at its most basic, Felinids are an ancient and rather simple human genotype. \
			One of many \"Animalid\" variants, Felinids were once one of the most popular, as well as one of the \
			biggest points of contention in genetic-modification and biological engineering.",

		"Felinids are the result of an ancient megacorporation's tinkering with genetic engineering and artificial womb technology \
			in attempts to engineer vatgrown sexually appealing \"designer mates\". They are both physically and psychologically \
			modified for giving both physical and mental pleasure.",

		"Sadly for the Felinids such extensive genetic modification and mental sculpting was considered unethical by the myriad \
			governments at the time. Either modified into more self-deterministic forms or disposed of en-masse, a small . \
			population of Felinids managed to survive largely unchanged by becoming far more hostile and \"feral\" towards \
			non-Felinid outsiders.",
	)

// Felinids are subtypes of humans.
// This shouldn't call parent or we'll get a buncha human related perks (though it doesn't have a reason to).
/datum/species/human/felinid/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "grin-tongue",
			SPECIES_PERK_NAME = "Grooming",
			SPECIES_PERK_DESC = "Felinids can lick wounds to reduce bleeding.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "assistive-listening-systems",
			SPECIES_PERK_NAME = "Sensitive Hearing",
			SPECIES_PERK_DESC = "Felinids are more sensitive to loud sounds, such as flashbangs.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "shower",
			SPECIES_PERK_NAME = "Hydrophobia",
			SPECIES_PERK_DESC = "Felinids don't like getting soaked with water.",
		),
	)

	return to_add
