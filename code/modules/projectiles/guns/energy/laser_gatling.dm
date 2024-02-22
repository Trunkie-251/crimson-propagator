

//The ammo/gun is stored in a back slot item
/obj/item/minigunpack
	name = "backpack power source"
	desc = "The massive external power source for the laser gatling gun."
	icon = 'icons/obj/weapons/guns/minigun.dmi'
	icon_state = "holstered"
	inhand_icon_state = "backpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/gun/energy/minigun/gun
	var/obj/item/stock_parts/cell/minigun/battery
	var/armed = FALSE //whether the gun is attached, FALSE is attached, TRUE is the gun is wielded.
	var/overheat = 0
	var/overheat_max = 40
	var/heat_diffusion = 0.5

/obj/item/minigunpack/Initialize(mapload)
	. = ..()
	gun = new(src)
	battery = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/minigunpack/Destroy()
	if(!QDELETED(gun))
		qdel(gun)
	gun = null
	QDEL_NULL(battery)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/minigunpack/process(seconds_per_tick)
	overheat = max(0, overheat - heat_diffusion * seconds_per_tick)

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/minigunpack/attack_hand(mob/living/carbon/user, list/modifiers)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(ITEM_SLOT_BACK) == src)
				armed = TRUE
				if(!user.put_in_hands(gun))
					armed = FALSE
					to_chat(user, span_warning("You need a free hand to hold the gun!"))
					return
				update_appearance()
				user.update_worn_back()
		else
			to_chat(user, span_warning("You are already holding the gun!"))
	else
		..()

/obj/item/minigunpack/attackby(obj/item/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		..()

/obj/item/minigunpack/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/minigunpack/MouseDrop(atom/over_object)
	. = ..()
	if(armed)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.incapacitated())

			if(istype(over_object, /atom/movable/screen/inventory/hand))
				var/atom/movable/screen/inventory/hand/H = over_object
				M.putItemFromInventoryInHandIfPossible(src, H.held_index)


/obj/item/minigunpack/update_icon_state()
	icon_state = armed ? "notholstered" : "holstered"
	return ..()

/obj/item/minigunpack/proc/attach_gun(mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = FALSE
	if(user)
		to_chat(user, span_notice("You attach the [gun.name] to the [name]."))
	else
		src.visible_message(span_warning("The [gun.name] snaps back onto the [name]!"))
	update_appearance()
	user.update_worn_back()


/obj/item/gun/energy/minigun
	name = "laser gatling gun"
	desc = "An advanced laser cannon with an incredible rate of fire. Requires a bulky backpack power source to use."
	icon = 'icons/obj/weapons/guns/minigun.dmi'
	icon_state = "minigun_spin"
	inhand_icon_state = "minigun"
	slowdown = 1
	slot_flags = null
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = null
	weapon_weight = WEAPON_HEAVY
	ammo_type = list(/obj/item/ammo_casing/energy/laser/minigun)
	cell_type = /obj/item/stock_parts/cell/crap
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	can_charge = FALSE
	var/obj/item/minigunpack/ammo_pack

/obj/item/gun/energy/minigun/Initialize(mapload)
	if(!istype(loc, /obj/item/minigunpack)) //We should spawn inside an ammo pack so let's use that one.
		return INITIALIZE_HINT_QDEL //No pack, no gun
	ammo_pack = loc
	AddElement(/datum/element/update_icon_blocker)
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)
	return ..()

/obj/item/gun/energy/minigun/Destroy()
	if(!QDELETED(ammo_pack))
		qdel(ammo_pack)
	ammo_pack = null
	return ..()

/obj/item/gun/energy/minigun/attack_self(mob/living/user)
	return

/obj/item/gun/energy/minigun/dropped(mob/user)
	SHOULD_CALL_PARENT(FALSE)
	if(ammo_pack)
		ammo_pack.attach_gun(user)
	else
		qdel(src)

/obj/item/gun/energy/minigun/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(ammo_pack && ammo_pack.overheat >= ammo_pack.overheat_max)
		to_chat(user, span_warning("The gun's heat sensor locked the trigger to prevent lens damage!"))
		return
	..()
	ammo_pack.overheat++
	if(ammo_pack.battery)
		var/totransfer = min(100, ammo_pack.battery.charge)
		var/transferred = cell.give(totransfer)
		ammo_pack.battery.use(transferred)


/obj/item/gun/energy/minigun/afterattack(atom/target, mob/living/user, flag, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, span_warning("You need the backpack power source to fire the gun!"))
	. = ..()

/obj/item/stock_parts/cell/minigun
	name = "gatling gun fusion core"
	desc = "Where did these come from?"
	maxcharge = 500000
	chargerate = 5000


//VOLKITE POWERPACK

/obj/item/minigunpack/volkite
	name = "Fission powerpack"
	desc = "A super-heavy fission-powered powerpack designed to allow lightly-augmented soldiers wield heavy energy \
	weapons. Your spine just hurts from looking at this."
	icon = 'icons/obj/weapons/guns/minigun.dmi'
	icon_state = "holstered"
	inhand_icon_state = "backpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
var/obj/item/gun/energy/laser/volkite/heavy/volk

/obj/item/minigunpack/volkite/Initialize(mapload)
	. = ..()
	volk = new(src)
	battery = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/minigunpack/volkite/Destroy()
	if(!QDELETED(volk))
		qdel(volk)
	volk = null
	QDEL_NULL(battery)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/minigunpack/volkite/process(seconds_per_tick)
	overheat = max(0, overheat - heat_diffusion * seconds_per_tick)

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/minigunpack/volkite/attack_hand(mob/living/carbon/user, list/modifiers)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(ITEM_SLOT_BACK) == src)
				armed = TRUE
				if(!user.put_in_hands(volk))
					armed = FALSE
					to_chat(user, span_warning("You need a free hand to hold the gun!"))
					return
				update_appearance()
				user.update_worn_back()
		else
			to_chat(user, span_warning("You are already holding the gun!"))
	else
		..()

/obj/item/minigunpack/volkite/attackby(obj/item/W, mob/user, params)
	if(W == volk) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(volk, TRUE)
	else
		..()

/obj/item/minigunpack/volkite/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(volk, TRUE)

/obj/item/minigunpack/volkite/MouseDrop(atom/over_object)
	. = ..()
	if(armed)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.incapacitated())

			if(istype(over_object, /atom/movable/screen/inventory/hand))
				var/atom/movable/screen/inventory/hand/H = over_object
				M.putItemFromInventoryInHandIfPossible(src, H.held_index)


/obj/item/minigunpack/volkite/update_icon_state()
	icon_state = armed ? "notholstered" : "holstered"
	return ..()

/obj/item/minigunpack/volkite/proc/attach_volk(mob/user)
	if(!volk)
		volk = new(src)
	volk.forceMove(src)
	armed = FALSE
	if(user)
		to_chat(user, span_notice("You attach the [volk.name] to the [name]."))
	else
		src.visible_message(span_warning("The [volk.name] snaps back onto the [name]!"))
	update_appearance()
	user.update_worn_back()

//HEAVY VOLKITE GUN

/obj/item/gun/energy/laser/volkite/heavy
	name ="RZ-Volkite Culverin"
	desc = "An infantry-portable version of the Volkite Culverin, typically mounted on vehicles and heavy combat synths. This weapon brings the \
	wrath of the Triarchs upon those who do not deserve their blessings, cleansing their flesh in exalted thermal radiation. Blessed be those who use it."
	icon = 'icons/obj/weapons/guns/imperial_guns.dmi'
	icon_state = "volkite_heavy"
	inhand_icon_state = "volkite"
	fire_delay = 14
	ammo_type = list(/obj/item/ammo_casing/energy/volkite/heavy)
	cell_type = /obj/item/stock_parts/cell/crap
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	var/obj/item/minigunpack/volkite/ammo_pack

/obj/item/gun/energy/laser/volkite/heavy/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 5)

/obj/item/gun/energy/laser/volkite/heavy/Initialize(mapload)
	if(!istype(loc, /obj/item/minigunpack/volkite)) //We should spawn inside an ammo pack so let's use that one.
		return INITIALIZE_HINT_QDEL //No pack, no gun
	ammo_pack = loc
	AddElement(/datum/element/update_icon_blocker)
	return ..()

/obj/item/gun/energy/laser/volkite/heavy/Destroy()
	if(!QDELETED(ammo_pack))
		qdel(ammo_pack)
	ammo_pack = null
	return ..()

/obj/item/gun/energy/laser/volkite/heavy/attack_self(mob/living/user)
	return

/obj/item/gun/energy/laser/volkite/heavy/dropped(mob/user)
	SHOULD_CALL_PARENT(FALSE)
	if(ammo_pack)
		ammo_pack.attach_volk(user)
	else
		qdel(src)

/obj/item/gun/energy/laser/volkite/heavy/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(ammo_pack && ammo_pack.overheat >= ammo_pack.overheat_max)
		to_chat(user, span_warning("The gun's heat sensor locked the trigger to prevent lens damage!"))
		return
	..()
	ammo_pack.overheat++
	if(ammo_pack.battery)
		var/totransfer = min(100, ammo_pack.battery.charge)
		var/transferred = cell.give(totransfer)
		ammo_pack.battery.use(transferred)


/obj/item/gun/energy/laser/volkite/heavy/afterattack(atom/target, mob/living/user, flag, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, span_warning("You need the backpack power source to fire the gun!"))
	. = ..()
