//synthetic bodyparts
// TODO: Add synth healing mechanics

/obj/item/bodypart/head/synthetic
	name = "Synthetic Head"
	desc = "A reptillian-inspired head with a soft non-toxic skin. The underlying myomer muscle is quite strong."
	icon = 'icons/mob/human/species/robot/bodyparts.dmi'
	icon_state = "synthetic_head"
	icon_static = 'icons/mob/human/species/robot/bodyparts.dmi'
	limb_id = SPECIES_SYNTHETIC
	is_dimorphic = FALSE
	head_flags = HEAD_EYESPRITES|HEAD_EYECOLOR
	bodytype = BODYTYPE_HUMANOID|BODYTYPE_ORGANIC
	biological_state = BIO_BONE
	should_draw_greyscale = FALSE
	dmg_overlay_type = TRUE
	brute_modifier = 0.6 //synthetics are tough cookies, being composed of an alloy endoskeleton wrapped in myomer muscle
	burn_modifier = 0.6


/obj/item/bodypart/chest/synthetic
	name = "Synthetic torso"
	desc = "Arguably the most durable part of a Gen-4 Technocracy Exoframe. The torso holds a synth's \
	atomic power core beneath layers of artificial muscle and interlocking ribs."
	icon = 'icons/mob/human/species/robot/bodyparts.dmi'
	icon_state = "synthetic_chest"
	icon_static = 'icons/mob/human/species/robot/bodyparts.dmi'
	limb_id = SPECIES_SYNTHETIC
	is_dimorphic = TRUE
	bodytype = BODYTYPE_HUMANOID|BODYTYPE_ORGANIC
	biological_state = BIO_BONE
	should_draw_greyscale = FALSE
	dmg_overlay_type = TRUE
	brute_modifier = 0.45 //The torso is arguably the most armoured area of a synth.
	burn_modifier = 0.6

/obj/item/bodypart/arm/right/synthetic
	name = "synthetic right arm"
	desc = "A synthetic arm, rated at four hundred foot pounds worth of strength. \
	Enough to crush every bone in your body."
	icon = 'icons/mob/human/species/robot/bodyparts.dmi'
	icon_state = "synthetic_r_arm"
	icon_static = 'icons/mob/human/species/robot/bodyparts.dmi'
	limb_id = SPECIES_SYNTHETIC
	is_dimorphic = FALSE
	bodytype = BODYTYPE_HUMANOID|BODYTYPE_ORGANIC
	biological_state = BIO_BONE
	should_draw_greyscale = FALSE
	dmg_overlay_type = TRUE
	brute_modifier = 0.6
	burn_modifier = 0.6
	unarmed_damage_low = 9
	unarmed_damage_high = 14

/obj/item/bodypart/arm/left/synthetic
	name = "synthetic left arm"
	desc = "A synthetic arm, rated at four hundred foot pounds worth of strength. \
	Enough to crush every bone in your body."
	icon = 'icons/mob/human/species/robot/bodyparts.dmi'
	icon_state = "synthetic_l_arm"
	icon_static = 'icons/mob/human/species/robot/bodyparts.dmi'
	limb_id = SPECIES_SYNTHETIC
	is_dimorphic = FALSE
	bodytype = BODYTYPE_HUMANOID|BODYTYPE_ORGANIC
	biological_state = NONE
	should_draw_greyscale = FALSE
	dmg_overlay_type = TRUE
	brute_modifier = 0.6
	burn_modifier = 0.6
	unarmed_damage_low = 9
	unarmed_damage_high = 14


/obj/item/bodypart/leg/left/synthetic
	icon = 'icons/mob/human/species/robot/bodyparts.dmi'
	icon_state = "synthetic_l_leg"
	icon_static = 'icons/mob/human/species/robot/bodyparts.dmi'
	limb_id = SPECIES_SYNTHETIC
	is_dimorphic = FALSE
	bodytype = BODYTYPE_HUMANOID|BODYTYPE_ORGANIC
	biological_state = BIO_BONE
	should_draw_greyscale = FALSE
	dmg_overlay_type = TRUE
	brute_modifier = 0.6
	burn_modifier = 0.6
	unarmed_damage_low = 9
	unarmed_damage_high = 14

/obj/item/bodypart/leg/right/synthetic
	icon = 'icons/mob/human/species/robot/bodyparts.dmi'
	icon_state = "synthetic_r_leg"
	icon_static = 'icons/mob/human/species/robot/bodyparts.dmi'
	limb_id = SPECIES_SYNTHETIC
	is_dimorphic = FALSE
	bodytype = BODYTYPE_HUMANOID|BODYTYPE_ORGANIC
	biological_state = BIO_BONE
	should_draw_greyscale = FALSE
	dmg_overlay_type = TRUE
	brute_modifier = 0.6
	burn_modifier = 0.6
	unarmed_damage_low = 9
	unarmed_damage_high = 14

/obj/item/bodypart/head/synthetic/rook
	desc = "A reptillian-inspired head with a soft non-toxic skin. The underlying myomer muscle is quite strong."
	icon = 'icons/mob/human/species/robot/oversized_bodyparts.dmi'
	icon_state = "rook_head"
	icon_static = 'icons/mob/human/species/robot/oversized_bodyparts.dmi'
	limb_id = SPECIES_ROOK

/obj/item/bodypart/chest/synthetic/rook
	desc = "Arguably the most durable part of a Gen-4 Technocracy Exoframe. The torso holds a synth's \
	atomic power core beneath layers of artificial muscle and interlocking ribs."
	icon = 'icons/mob/human/species/robot/oversized_bodyparts.dmi'
	icon_state = "rook_chest"
	icon_static = 'icons/mob/human/species/robot/oversized_bodyparts.dmi'
	limb_id = SPECIES_ROOK
	is_dimorphic = FALSE

