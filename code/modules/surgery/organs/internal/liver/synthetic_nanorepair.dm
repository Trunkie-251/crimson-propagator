/obj/item/organ/internal/liver/synthetic
	name = "Nano-repair Hive"
	desc = "A multifold stomach-like organ composed of several filtration, \
	processing, and manufacturing micro-units that use ingested material to repair \
	damaged components. Extremely toxic and not rated for organic use."
	icon_state = "synth_repair_nanohive"
	organ_flags = ORGAN_ROBOTIC

	var/nano_repair_brute = 1
	var/nano_repair_burn = 1

/obj/item/organ/internal/liver/synthetic/handle_chemical(mob/living/carbon/organ_owner, datum/reagent/chem, seconds_per_tick, times_fired)
	. = ..()
	if((. & COMSIG_MOB_STOP_REAGENT_CHECK) || (organ_flags & ORGAN_FAILING))
		return
	if(istype(chem, /datum/reagent/carbon) || istype(chem, /datum/reagent/acetone))
		if(chem.volume > 30)
			organ_owner.reagents.remove_reagent(chem.type, (chem.volume - 30))
			to_chat(organ_owner, span_warning("Your self-repair mechanites are active!"))
		organ_owner.heal_bodypart_damage(nano_repair_brute * REM * seconds_per_tick, nano_repair_burn * REM * seconds_per_tick)
		for(var/datum/wound/iter_wound as anything in organ_owner.all_wounds)
			iter_wound.on_xadone(1 * REM * seconds_per_tick)
		return // Do normal metabolism

//Add healing chemicals
//acetone for physical damage
//carbon for physical damage
//silicon for ???
