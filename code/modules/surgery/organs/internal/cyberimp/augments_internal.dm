//general cybernetic implants.

/obj/item/organ/internal/cyberimp
	name = "cybernetic implant"
	desc = "A state-of-the-art implant that improves a baseline's functionality."
	visual = FALSE
	organ_flags = ORGAN_ROBOTIC
	zone = BODY_ZONE_CHEST
	var/implant_color = "#FFFFFF"
	var/implant_overlay

/obj/item/organ/internal/cyberimp/New(mob/implanted_mob = null)
	if(iscarbon(implanted_mob))
		src.Insert(implanted_mob)
	if(implant_overlay)
		var/mutable_appearance/overlay = mutable_appearance(icon, implant_overlay)
		overlay.color = implant_color
		add_overlay(overlay)
	return ..()

//[[[[BRAIN]]]]

/obj/item/organ/internal/cyberimp/brain
	name = "cybernetic brain implant"
	desc = "Injectors of extra sub-routines for the brain."
	icon_state = "brain_implant"
	implant_overlay = "brain_implant_overlay"
	zone = BODY_ZONE_HEAD
	w_class = WEIGHT_CLASS_TINY

//Neural Interface, the server's PDA-equivilent

/obj/item/organ/internal/cyberimp/brain/neural_interface
	name = "Neural Interface"
	desc = "An important cybernetic implant seen in all facets of life, no matter rich or poor. \
	This augmentation allows for one to neurally interace with all sorts of other imperial technologies."
	icon_state = "brain_implant"
	implant_overlay = "brain_implant_overlay"
	overlay = /datum/bodypart_overlay/simple/overlay/interface
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_BRAIN_NEURALINTERFACE
	w_class = WEIGHT_CLASS_TINY
	actions_types = list(/datum/action/item_action/organ_action/toggle)

	var/obj/item/modular_computer/pda/pda = /obj/item/modular_computer/pda

/obj/item/organ/internal/cyberimp/brain/neural_interface/Initialize(mapload)
	. = ..()
	pda = new pda(src)

/obj/item/organ/internal/cyberimp/brain/neural_interface/Destroy()
	. = ..()
	QDEL_NULL(pda)

/obj/item/organ/internal/cyberimp/brain/neural_interface/examine(mob/user)
    . = ..()
    if(pda)
        . += span_notice("[pda] is attached to [src].")
    else
        . += span_warning("There is no PDA attached to [src].")

/obj/item/organ/internal/cyberimp/brain/neural_interface/attackby(obj/item/attacking_item, mob/user, params)
    . = ..()
    if(. || !istype(attacking_item, /obj/item/modular_computer/pda))
        return
    if(pda)
        to_chat(user, span_warning("There is already a PDA attached to [src]."))
        return
    user.transferItemToLoc(attacking_item, src)
    pda = attacking_item
    to_chat(user, span_notice("You attach \the [pda] to [src]."))
    return TRUE

/obj/item/organ/internal/cyberimp/brain/neural_interface/screwdriver_act(mob/living/user, obj/item/tool)
    . = ..()
    if(.)
        return TRUE

    if(!pda)
        to_chat(user, span_warning("There is no PDA to be removed from [src]."))
        return TRUE

    user.transferItemToLoc(pda, user.loc)
    user.put_in_hands(pda)
    to_chat(user, span_notice("You remove \the [pda] from [src]."))
    pda = null
    return TRUE

/datum/bodypart_overlay/simple/overlay/interface
    icon = 'icons/mob/human/species/robot/exoskeletons.dmi'
    icon_state = "interface"
    layers = EXTERNAL_ADJACENT|BACK_LAYER


/obj/item/organ/internal/cyberimp/brain/anti_drop
	name = "anti-drop implant"
	desc = "This cybernetic brain implant will allow you to force your hand muscles to contract, preventing item dropping. Twitch ear to toggle."
	var/active = FALSE
	var/list/stored_items = list()
	implant_color = "#DE7E00"
	slot = ORGAN_SLOT_BRAIN_ANTIDROP
	actions_types = list(/datum/action/item_action/organ_action/toggle)

/obj/item/organ/internal/cyberimp/brain/anti_drop/ui_action_click()
	active = !active
	if(active)
		var/list/hold_list = owner.get_empty_held_indexes()
		if(LAZYLEN(hold_list) == owner.held_items.len)
			to_chat(owner, span_notice("You are not holding any items, your hands relax..."))
			active = FALSE
			return
		for(var/obj/item/held_item as anything in owner.held_items)
			if(!held_item)
				continue
			stored_items += held_item
			to_chat(owner, span_notice("Your [owner.get_held_index_name(owner.get_held_index_of_item(held_item))]'s grip tightens."))
			ADD_TRAIT(held_item, TRAIT_NODROP, IMPLANT_TRAIT)
			RegisterSignal(held_item, COMSIG_ITEM_DROPPED, PROC_REF(on_held_item_dropped))
	else
		release_items()
		to_chat(owner, span_notice("Your hands relax..."))


/obj/item/organ/internal/cyberimp/brain/anti_drop/proc/release_items()
	for(var/obj/item/stored_item as anything in stored_items)
		REMOVE_TRAIT(stored_item, TRAIT_NODROP, IMPLANT_TRAIT)
		UnregisterSignal(stored_item, COMSIG_ITEM_DROPPED)
	stored_items = list()


/obj/item/organ/internal/cyberimp/brain/anti_drop/Remove(mob/living/carbon/implant_owner, special = 0)
	if(active)
		ui_action_click()
	..()

/obj/item/organ/internal/cyberimp/brain/anti_drop/proc/on_held_item_dropped(obj/item/source, mob/user)
	SIGNAL_HANDLER
	REMOVE_TRAIT(source, TRAIT_NODROP, IMPLANT_TRAIT)
	UnregisterSignal(source, COMSIG_ITEM_DROPPED)
	stored_items -= source

/obj/item/organ/internal/cyberimp/brain/anti_stun
	name = "CNS Rebooter implant"
	desc = "This implant will automatically give you back control over your central nervous system, reducing downtime when stunned."
	implant_color = "#FFFF00"
	slot = ORGAN_SLOT_BRAIN_ANTISTUN

	var/static/list/signalCache = list(
		COMSIG_LIVING_STATUS_STUN,
		COMSIG_LIVING_STATUS_KNOCKDOWN,
		COMSIG_LIVING_STATUS_IMMOBILIZE,
		COMSIG_LIVING_STATUS_PARALYZE,
	)

	var/stun_cap_amount = 40

/obj/item/organ/internal/cyberimp/brain/anti_stun/on_remove(mob/living/carbon/implant_owner)
	. = ..()
	UnregisterSignal(implant_owner, signalCache)

/obj/item/organ/internal/cyberimp/brain/anti_stun/on_insert(mob/living/carbon/receiver)
	. = ..()
	RegisterSignals(receiver, signalCache, PROC_REF(on_signal))

/obj/item/organ/internal/cyberimp/brain/anti_stun/proc/on_signal(datum/source, amount)
	SIGNAL_HANDLER
	if(!(organ_flags & ORGAN_FAILING) && amount > 0)
		addtimer(CALLBACK(src, PROC_REF(clear_stuns)), stun_cap_amount, TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/item/organ/internal/cyberimp/brain/anti_stun/proc/clear_stuns()
	if(owner || !(organ_flags & ORGAN_FAILING))
		owner.SetStun(0)
		owner.SetKnockdown(0)
		owner.SetImmobilized(0)
		owner.SetParalyzed(0)

/obj/item/organ/internal/cyberimp/brain/anti_stun/proc/reboot()
	organ_flags &= ~ORGAN_FAILING

//[[[[MOUTH]]]]
/obj/item/organ/internal/cyberimp/mouth
	zone = BODY_ZONE_PRECISE_MOUTH

/obj/item/organ/internal/cyberimp/mouth/breathing_tube
	name = "breathing tube implant"
	desc = "This simple implant adds an internals connector to your back, allowing you to use internals without a mask and protecting you from being choked."
	icon_state = "implant_mask"
	slot = ORGAN_SLOT_BREATHING_TUBE
	w_class = WEIGHT_CLASS_TINY
	overlay = /datum/bodypart_overlay/simple/overlay/breathing_tube

/datum/bodypart_overlay/simple/overlay/breathing_tube
    icon = 'icons/mob/human/species/robot/exoskeletons.dmi'
    icon_state = "breathing"
    layers = EXTERNAL_ADJACENT|BACK_LAYER

//BOX O' IMPLANTS

/obj/item/storage/box/cyber_implants
	name = "boxed cybernetic implants"
	desc = "A sleek, sturdy box."
	icon_state = "cyber_implants"

/obj/item/storage/box/cyber_implants/PopulateContents()
	new /obj/item/autosurgeon/syndicate/xray_eyes(src)
	new /obj/item/autosurgeon/syndicate/anti_stun(src)
	new /obj/item/autosurgeon/syndicate/reviver(src)
	new /obj/item/autosurgeon/syndicate/anti_drop(src)
