/obj/item/organ/internal/exoskeleton
    name = "exoskeleton"
    desc = "An exoskeleton to be grafted onto machine frames."
    icon_state = "implant-reinforcers"
    visual = TRUE
    maxHealth = 1.5 * STANDARD_ORGAN_THRESHOLD
    w_class = WEIGHT_CLASS_HUGE
    organ_flags = ORGAN_ROBOTIC //Exoskeletons are purely mechanical augmentations for robots. Go wear a Modsuit, loser.
    zone = BODY_ZONE_CHEST

    /// Body zone we apply our bodypart overlay to, quite important, not always the zone the organ is in
    var/exoskeleton_zone = BODY_ZONE_CHEST
    /// Bodypart overlay applied to the chest the exoskeleton is in
    var/datum/bodypart_overlay/simple/exoskeleton/exoskeleton = /datum/bodypart_overlay/simple/exoskeleton
    var/datum/bodypart_overlay/simple/exoskeleton/head_exoskeleton = /datum/bodypart_overlay/simple/exoskeleton
    var/datum/bodypart_overlay/simple/exoskeleton/left_arm_exoskeleton = /datum/bodypart_overlay/simple/exoskeleton
    var/datum/bodypart_overlay/simple/exoskeleton/right_arm_exoskeleton = /datum/bodypart_overlay/simple/exoskeleton
    var/datum/bodypart_overlay/simple/exoskeleton/left_leg_exoskeleton = /datum/bodypart_overlay/simple/exoskeleton
    var/datum/bodypart_overlay/simple/exoskeleton/right_leg_exoskeleton = /datum/bodypart_overlay/simple/exoskeleton
	// burn and brute modifiers
    var/brute_modifier = 0
    var/burn_modifier = 0

/obj/item/organ/internal/exoskeleton/Initialize(mapload)
    . = ..()
    exoskeleton = new exoskeleton()

/obj/item/organ/internal/exoskeleton/on_insert(mob/living/carbon/organ_owner, special)
    . = ..()
    if(!exoskeleton_zone || !exoskeleton || !ishuman(organ_owner))
        return

    var/obj/item/bodypart/overlay_part = organ_owner.get_bodypart(exoskeleton_zone)
    overlay_part.add_bodypart_overlay(exoskeleton)
    organ_owner.update_body_parts()
    overlay_part.brute_modifier *= brute_modifier
    overlay_part.burn_modifier *= burn_modifier

/obj/item/organ/internal/exoskeleton/on_remove(mob/living/carbon/organ_owner, special)
    . = ..()
    if(!exoskeleton_zone || !exoskeleton || QDELETED(organ_owner) || !ishuman(organ_owner))
        return

    var/obj/item/bodypart/overlay_part = organ_owner.get_bodypart(exoskeleton_zone)
    overlay_part.remove_bodypart_overlay(exoskeleton)
    organ_owner.update_body_parts()
    overlay_part.brute_modifier /= brute_modifier
    overlay_part.burn_modifier /= burn_modifier

    var/obj/item/bodypart/chest/chest = organ_owner.get_bodypart(BODY_ZONE_CHEST)
    chest.remove_bodypart_overlay(exoskeleton)
    organ_owner.update_body_parts()

    var/obj/item/bodypart/head/head = organ_owner.get_bodypart(BODY_ZONE_HEAD)
    head.remove_bodypart_overlay(head_exoskeleton)
    organ_owner.update_body_parts()

    var/obj/item/bodypart/leg/left/left_arm = organ_owner.get_bodypart(BODY_ZONE_L_ARM)
    left_arm.remove_bodypart_overlay(left_arm_exoskeleton)
    organ_owner.update_body_parts()

    var/obj/item/bodypart/arm/right/right_arm = organ_owner.get_bodypart(BODY_ZONE_R_ARM)
    right_arm.remove_bodypart_overlay(right_arm_exoskeleton)
    organ_owner.update_body_parts()

    var/obj/item/bodypart/leg/left/left_leg = organ_owner.get_bodypart(BODY_ZONE_L_LEG)
    left_leg.remove_bodypart_overlay(left_leg_exoskeleton)
    organ_owner.update_body_parts()

    var/obj/item/bodypart/arm/right/right_leg = organ_owner.get_bodypart(BODY_ZONE_R_LEG)
    right_leg.remove_bodypart_overlay(right_leg_exoskeleton)
    organ_owner.update_body_parts()

/datum/bodypart_overlay/simple/exoskeleton
    icon = 'icons/mob/human/species/robot/visors.dmi'
    icon_state = "syntheticvisor"
    layers = EXTERNAL_FRONT

/datum/bodypart_overlay/simple/exoskeleton/get_image(image_layer, obj/item/bodypart/limb)
    return image(
        icon = icon,
        icon_state = "[icon_state]_[mutant_bodyparts_layertext(image_layer)]",
        layer = image_layer,
    )


//Visors are synthetic facecoverings
/obj/item/organ/internal/exoskeleton/screen/visor
    name = "synthetic visor"
    icon_state = "synth_visor_1"
    desc = "A synthetic visor meant to be layered over the soft squishy organs of a synth skull."
    zone = BODY_ZONE_HEAD
    slot = ORGAN_SLOT_EXOSKELETON_SCREEN
    w_class = WEIGHT_CLASS_SMALL
    exoskeleton_zone = BODY_ZONE_HEAD
    exoskeleton = /datum/bodypart_overlay/simple/exoskeleton/screen/visor
    brute_modifier = 0.97
    burn_modifier = 1

/datum/bodypart_overlay/simple/exoskeleton/screen/visor
    icon = 'icons/mob/human/species/robot/visors.dmi'
    icon_state = "syntheticvisor"
    layers = EXTERNAL_ADJACENT|BACK_LAYER

/obj/item/organ/internal/exoskeleton/screen/visor/armored
    name = "armored visor"
    icon_state = "synth_visor_2"
    desc = "A combat-grade synthetic visor manufactured from a hypersteel alloy. Very protective."
    zone = BODY_ZONE_HEAD
    slot = ORGAN_SLOT_EXOSKELETON_SCREEN
    w_class = WEIGHT_CLASS_SMALL
    exoskeleton_zone = BODY_ZONE_HEAD
    exoskeleton = /datum/bodypart_overlay/simple/exoskeleton/screen/visor/armored
    brute_modifier = 0.5
    burn_modifier = 0.8

/datum/bodypart_overlay/simple/exoskeleton/screen/visor/armored
    icon = 'icons/mob/human/species/robot/visors.dmi'
    icon_state = "syntheticvisor2"
    layers = EXTERNAL_ADJACENT|BACK_LAYER

//This is where synthetic plating is. Plates provide protection and/or abilities
/obj/item/organ/internal/exoskeleton/head/plating
    name = "head exoskin"
    icon_state = "head_plating"
    desc = "Soft, flexible layers of exoskin grafted onto the skull. Both pretty and protective."
    zone = BODY_ZONE_HEAD
    slot = ORGAN_SLOT_EXOSKELETON_HEAD
    w_class = WEIGHT_CLASS_NORMAL
    exoskeleton_zone = BODY_ZONE_HEAD
    exoskeleton = /datum/bodypart_overlay/simple/exoskeleton/head/plating
    brute_modifier = 0.85
    burn_modifier = 1

/datum/bodypart_overlay/simple/exoskeleton/head/plating
    icon = 'icons/mob/human/species/robot/exoskeletons.dmi'
    icon_state = "exohead"
    layers = EXTERNAL_ADJACENT|BACK_LAYER

/obj/item/organ/internal/exoskeleton/leg/left/plating
    name = "left leg exoskin"
    icon_state = "l_leg_plating"
    desc = "Slim layers of synthetic skin coated ontop of synthetic legs."
    zone = BODY_ZONE_L_LEG
    slot = ORGAN_SLOT_EXOSKELETON_L_LEG
    w_class = WEIGHT_CLASS_NORMAL
    exoskeleton_zone = BODY_ZONE_L_LEG
    exoskeleton = /datum/bodypart_overlay/simple/exoskeleton/leg/left/plating
    brute_modifier = 0.85
    burn_modifier = 1

/datum/bodypart_overlay/simple/exoskeleton/leg/left/plating
	icon = 'icons/mob/human/species/robot/exoskeletons.dmi'
	icon_state = "exolegleft"
	layers = EXTERNAL_ADJACENT|BACK_LAYER

/obj/item/organ/internal/exoskeleton/leg/right/plating
    name = "right leg exoskin"
    icon_state = "r_leg_plating"
    desc = "Slim layers of synthetic skin coated ontop of synthetic legs."
    zone = BODY_ZONE_R_LEG
    slot = ORGAN_SLOT_EXOSKELETON_R_LEG
    w_class = WEIGHT_CLASS_NORMAL
    exoskeleton_zone = BODY_ZONE_R_LEG
    exoskeleton = /datum/bodypart_overlay/simple/exoskeleton/leg/right/plating
    brute_modifier = 0.85
    burn_modifier = 1

/datum/bodypart_overlay/simple/exoskeleton/leg/right/plating
	icon = 'icons/mob/human/species/robot/exoskeletons.dmi'
	icon_state = "exolegright"
	layers = EXTERNAL_ADJACENT|BACK_LAYER

/obj/item/organ/internal/exoskeleton/chest/plating
    name = "torso exoskin"
    icon_state = "torso_plating"
    desc = "Exoskin for the chest."
    zone = BODY_ZONE_CHEST
    slot = ORGAN_SLOT_EXOSKELETON_CHEST
    w_class = WEIGHT_CLASS_HUGE
    exoskeleton_zone = BODY_ZONE_CHEST
    exoskeleton = /datum/bodypart_overlay/simple/exoskeleton/chest/plating
    brute_modifier = 0.85
    burn_modifier = 1

/datum/bodypart_overlay/simple/exoskeleton/chest/plating
	icon = 'icons/mob/human/species/robot/exoskeletons.dmi'
	icon_state = "exochest"
	layers = EXTERNAL_ADJACENT|BACK_LAYER

/obj/item/organ/internal/exoskeleton/arm/left/plating
    name = "left arm exoskin"
    icon_state = "l_arm_plating"
    desc = "Slim layers of synthetic skin coated ontop of synthetic arms."
    zone = BODY_ZONE_L_ARM
    slot = ORGAN_SLOT_EXOSKELETON_L_ARM
    w_class = WEIGHT_CLASS_NORMAL
    exoskeleton_zone = BODY_ZONE_L_ARM
    exoskeleton = /datum/bodypart_overlay/simple/exoskeleton/arm/left/plating
    brute_modifier = 0.85
    burn_modifier = 1

/datum/bodypart_overlay/simple/exoskeleton/arm/left/plating
	icon = 'icons/mob/human/species/robot/exoskeletons.dmi'
	icon_state = "exoarmleft"
	layers = EXTERNAL_ADJACENT|BACK_LAYER

/obj/item/organ/internal/exoskeleton/arm/right/plating
    name = "right arm exoskin"
    icon_state = "r_arm_plating"
    desc = "Slim layers of synthetic skin coated ontop of synthetic arms."
    zone = BODY_ZONE_R_ARM
    slot = ORGAN_SLOT_EXOSKELETON_R_ARM
    w_class = WEIGHT_CLASS_NORMAL
    exoskeleton_zone = BODY_ZONE_R_ARM
    exoskeleton = /datum/bodypart_overlay/simple/exoskeleton/arm/right/plating
    brute_modifier = 0.85
    burn_modifier = 1

/datum/bodypart_overlay/simple/exoskeleton/arm/right/plating
	icon = 'icons/mob/human/species/robot/exoskeletons.dmi'
	icon_state = "exoarmright"
	layers = EXTERNAL_ADJACENT|BACK_LAYER
