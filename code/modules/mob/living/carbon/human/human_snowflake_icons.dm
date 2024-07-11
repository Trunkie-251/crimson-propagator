#define RESOLVE_ICON_STATE(worn_item) (worn_item.worn_icon_state || worn_item.icon_state)

/// Returns the appropriate icon file for wearing a an item in the given slot
/mob/living/carbon/human/proc/get_worn_icon(obj/item/worn_item, item_slot = ITEM_SLOT_ICLOTHING,)
	var/icon_file
	if(worn_item)
		icon_file = worn_item.get_worn_icon(src, item_slot)

	if(icon_file)
		return icon_file

	switch(item_slot)
		if(ITEM_SLOT_ICLOTHING)
			/*
			This is how non-humanoid clothing works.
			You check if the mob has the right bodyflag, and the clothing has the corresponding clothing flag.
			handled_by_bodytype is used to track whether or not we successfully used an alternate sprite.
			It's set to TRUE to ease up on copy-paste.
			icon_file MUST be set to null by default, or it causes issues.
			handled_by_bodytype MUST be set to FALSE under the if(!icon_exists()) statement, or everything breaks.
			"override_file = handled_by_bodytype ? icon_file : null" MUST be added to the arguments of build_worn_icon()
			Friendly reminder that icon_exists(file, state, scream = TRUE) is your friend when debugging this code.
			*/
			var/obj/item/clothing/under/uniform = worn_item
			if(istype(uniform))
				if((bodytype & BODYTYPE_DIGITIGRADE) && (uniform.supports_variations_flags & CLOTHING_DIGITIGRADE_VARIATION))
					icon_file = DIGITIGRADE_UNIFORM_FILE



	if(!icon_exists(icon_file, RESOLVE_ICON_STATE(worn_item)))
		return

	return icon_file

/// Returns whether or not we should use female sprites, if possible
/mob/living/carbon/human/proc/should_use_female_icons(obj/item/worn_item, item_slot = ITEM_SLOT_ICLOTHING)
    if(!istype(worn_item, /obj/item/clothing/under) || (item_slot != ITEM_SLOT_ICLOTHING))
        return
    var/obj/item/clothing/under/uniform = worn_item
    if(!dna.species.sexes || \
        physique != FEMALE || \
        !(bodytype & BODYTYPE_HUMANOID) || \
        (uniform.female_sprite_flags & NO_FEMALE_UNIFORM | FEMALE_UNIFORM_CUSTOM))
        return
    return uniform.female_sprite_flags

/// Item version of get_worn_icon, in case we want to override the human proc entirely and do our own thing
/obj/item/proc/get_worn_icon(mob/living/carbon/human/user, item_slot = ITEM_SLOT_ICLOTHING)
	return

#undef RESOLVE_ICON_STATE
