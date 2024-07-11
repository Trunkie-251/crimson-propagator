/turf/closed/wall/r_wall/zrbite
	name = "\improper Zrbite Carapace-Hull"
	desc = " '...The walls were unlit, passages of flesh-and-yet-not-flesh, \
	pulsing with organic machinery and shifting vertabrae. Living yet not living. \
	Machine, yet not machine.' \n\
	\n\
	-- The Polygene Bible, Verses of the Mother"
	icon = 'icons/turf/walls/zrbite_wall.dmi'
	icon_state = "zrbite-0"
	base_icon_state = "zrbite"
	hardness = 7
	sheet_type = /obj/item/stack/sheet/mineral/zrbite
	sheet_amount = 3
	girder_type = /obj/structure/girder/reinforced
	explosive_resistance = 4


/turf/closed/wall/r_wall/zrbite/deconstruction_hints(mob/user)
	switch(d_state)
		if(INTACT)
			return span_notice("The outer <b>shell</b> is fully intact.")
		if(SUPPORT_LINES)
			return span_notice("The outer <i>shell</i> has surgically cut, and it looks like it could be <b>pried</b>.")
		if(COVER)
			return span_notice("The outer shell has been <i>pried</i> off, the support cybernetics are <b>grafted</b> firmly in place.")
		if(CUT_COVER)
			return span_notice("The support cybernetics have been <i>removed</i>, and the <b>external skeleton</b> is still attached to the girder.")
		if(ANCHOR_BOLTS)
			return span_notice("The exoskeleton <i>pried away</i>, and the bolts anchoring the support rods are <b>wrenched</b> in place.")
		if(SUPPORT_RODS)
			return span_notice("The bolts anchoring the support rods have been <i>loosened</i>, but are still <b>welded</b> firmly to the girder.")
		if(SHEATH)
			return span_notice("The support rods have been <i>sliced through</i>, and the outer sheath is <b>connected loosely</b> to the girder.")

/turf/closed/wall/r_wall/mineral/zrbite/devastate_wall()
	new sheet_type(src, sheet_amount)
	new /obj/item/stack/sheet/mineral/zrbite(src, 2)

/turf/closed/wall/r_wall/zrbite/try_decon(obj/item/W, mob/user, turf/T)
	//Shell incision
	switch(d_state)
		if(INTACT)
			if(W.tool_behaviour == TOOL_SAW)
				W.play_tool_sound(src, 100)
				d_state = SUPPORT_LINES
				update_appearance()
				to_chat(user, span_notice("You surgically cut open the outer shell."))
				return TRUE
// Shell removal
		if(SUPPORT_LINES)
			if(W.tool_behaviour == TOOL_CROWBAR)
				to_chat(user, span_notice("I begin to pry off the shell..."))
				if(W.use_tool(src, user, 40, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != SUPPORT_LINES)
						return TRUE
					d_state = COVER
					update_appearance()
					to_chat(user, span_notice("You pry off the shell."))
				return TRUE
// Shell cauterization (I.E, cancelling the shell removal)
			else if(W.tool_behaviour == TOOL_CAUTERY)
				W.play_tool_sound(src, 100)
				d_state = INTACT
				update_appearance()
				to_chat(user, span_notice("I seal the shell back up."))
				return TRUE
// (Organ removal)
		if(COVER)
			if(W.tool_behaviour == TOOL_SCALPEL)
				to_chat(user, span_notice("I begin to surgically remove the internal organs."))
				if(W.use_tool(src, user, 60, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != COVER)
						return TRUE
					d_state = CUT_COVER
					update_appearance()
					to_chat(user, span_notice("I cleanly remove the internal organs."))
				return TRUE
// Cybernetics implantation
			if(W.tool_behaviour == TOOL_SCREWDRIVER)
				to_chat(user, span_notice("I begin screwing the support cybernetics in..."))
				if(W.use_tool(src, user, 40, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != COVER)
						return TRUE
					d_state = SUPPORT_LINES
					update_appearance()
					to_chat(user, span_notice("I secure the support cybernetics."))
				return TRUE
// exoskeleton removal
		if(CUT_COVER)
			if(W.tool_behaviour == TOOL_CROWBAR)
				to_chat(user, span_notice("I begin to pry off the exoskeleton"))
				if(W.use_tool(src, user, 100, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != CUT_COVER)
						return TRUE
					d_state = ANCHOR_BOLTS
					update_appearance()
					to_chat(user, span_notice("I pry off the exoskeleton."))
				return TRUE

			if(W.tool_behaviour == TOOL_HEMOSTAT)
				to_chat(user, span_notice("I begin planting the support cybernetics in..."))
				if(W.use_tool(src, user, 60, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != CUT_COVER)
						return TRUE
					d_state = COVER
					update_appearance()
					to_chat(user, span_notice("I secure the support cybernetics."))
				return TRUE

		if(ANCHOR_BOLTS)
			if(W.tool_behaviour == TOOL_WRENCH)
				to_chat(user, span_notice("I start loosening the anchoring bolts which secure the support rods to their frame..."))
				if(W.use_tool(src, user, 40, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != ANCHOR_BOLTS)
						return TRUE
					d_state = SUPPORT_RODS
					update_appearance()
					to_chat(user, span_notice("I remove the bolts anchoring the support rods."))
				return TRUE

			if(W.tool_behaviour == TOOL_CROWBAR)
				to_chat(user, span_notice("I start to pry the cover back into place..."))
				if(W.use_tool(src, user, 20, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != ANCHOR_BOLTS)
						return TRUE
					d_state = CUT_COVER
					update_appearance()
					to_chat(user, span_notice("I pry the metal cover back into place."))
				return TRUE

		if(SUPPORT_RODS)
			if(W.tool_behaviour == TOOL_WELDER)
				if(!W.tool_start_check(user, amount=2))
					return
				to_chat(user, span_notice("I begin slicing through the support rods..."))
				if(W.use_tool(src, user, 100, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != SUPPORT_RODS)
						return TRUE
					d_state = SHEATH
					update_appearance()
					to_chat(user, span_notice("I slice through the support rods."))
				return TRUE

			if(W.tool_behaviour == TOOL_WRENCH)
				to_chat(user, span_notice("I start tightening the bolts which secure the support rods to their frame..."))
				W.play_tool_sound(src, 100)
				if(W.use_tool(src, user, 40))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != SUPPORT_RODS)
						return TRUE
					d_state = ANCHOR_BOLTS
					update_appearance()
					to_chat(user, span_notice("I tighten the bolts anchoring the support rods."))
				return TRUE

		if(SHEATH)
			if(W.tool_behaviour == TOOL_CROWBAR)
				to_chat(user, span_notice("I struggle to pry off the outer sheath..."))
				if(W.use_tool(src, user, 100, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != SHEATH)
						return TRUE
					to_chat(user, span_notice("I pry off the outer sheath."))
					dismantle_wall()
				return TRUE

			if(W.tool_behaviour == TOOL_WELDER)
				if(!W.tool_start_check(user, amount=0))
					return
				to_chat(user, span_notice("I begin welding the support rods back together..."))
				if(W.use_tool(src, user, 100, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall/zrbite) || d_state != SHEATH)
						return TRUE
					d_state = SUPPORT_RODS
					update_appearance()
					to_chat(user, span_notice("I weld the support rods back together."))
				return TRUE
	return FALSE

/turf/closed/wall/r_wall/zrbite/update_icon(updates=ALL)
	. = ..()
	if(d_state != INTACT)
		smoothing_flags = NONE
		return
	if (!(updates & UPDATE_SMOOTHING))
		return
	smoothing_flags = SMOOTH_BITMASK
	QUEUE_SMOOTH_NEIGHBORS(src)
	QUEUE_SMOOTH(src)

/turf/closed/wall/r_wall/zrbite/update_icon_state()
	if(d_state != INTACT)
		icon_state = "z_wall-[d_state]"
	else
		icon_state = "[base_icon_state]-[smoothing_junction]"
	return ..()
