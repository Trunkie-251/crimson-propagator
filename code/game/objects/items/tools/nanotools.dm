/obj/item/nanotool
	name = "Industrial Nanotool"
	desc = "A advanced reconfigurable nanotechnological hand-tool. \
	This one seems to be an industrial model."
	icon = 'icons/obj/tools.dmi'
	icon_state = "crowbar_szzara"

/obj/item/nanotool/examine()
	. = ..()
	. += " The current mode is: [tool_behaviour]"

/obj/item/nanotool/proc/check_menu(mob/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated() || !user.Adjacent(src))
		return FALSE
	return TRUE


/obj/item/nanotool/attack_self(mob/user)
	if(!user)
		return
	var/list/tool_list = list(
		"Crowbar" = image(icon = 'icons/obj/tools.dmi', icon_state = "crowbar_szzara"),
		"Screwdriver" = image(icon = 'icons/obj/tools.dmi', icon_state = "screwdriver_map"),
		"Wirecutters" = image(icon = 'icons/obj/tools.dmi', icon_state = "wirecutters_szzara"),
		"Wrench" = image(icon = 'icons/obj/tools.dmi', icon_state = "wrench_szzara"),
		)
	var/tool_result = show_radial_menu(user, src, tool_list, custom_check = CALLBACK(src, PROC_REF(check_menu), user), require_near = TRUE, tooltips = TRUE)
	if(!check_menu(user))
		return
	switch(tool_result)
		if("Crowbar")
			tool_behaviour = TOOL_CROWBAR
			icon_state = "crowbar_szzara"
			usesound = 'sound/weapons/sonic_jackhammer.ogg'
			toolspeed = 0.3
		if("Screwdriver")
			tool_behaviour = TOOL_SCREWDRIVER
			usesound = 'sound/items/screwdriver.ogg'
			toolspeed = 0.6
		if("Wirecutters")
			tool_behaviour = TOOL_WIRECUTTER
			icon_state = "wirecutters_szzara"
			usesound = 'sound/items/wirecutter.ogg'
			toolspeed = 0.7
		if("Wrench")
			tool_behaviour = TOOL_WRENCH
			icon_state ="wrench_szzara"
			usesound = 'sound/items/wrenching_sound.ogg'
			toolspeed = 0.6
