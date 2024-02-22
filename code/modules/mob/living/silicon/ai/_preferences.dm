// A mapping between AI_EMOTION_* string constants, which also double as user readable descriptions, and the name of the iconfile. (used for /obj/machinery/status_display/ai )
GLOBAL_LIST_INIT(ai_status_display_emotes, list(
	AI_EMOTION_AWESOME = "ai_awesome",
	AI_EMOTION_BLANK = AI_DISPLAY_DONT_GLOW,
	AI_EMOTION_BSOD = "ai_bsod",
))

// New items need to also be added to ai_hologram_icon_state list
GLOBAL_LIST_INIT(ai_hologram_icons, list(
	AI_HOLOGRAM_BEAR = 'icons/mob/simple/animal.dmi',
	AI_HOLOGRAM_CARP = 'icons/mob/simple/carp.dmi',
	AI_HOLOGRAM_CAT = 'icons/mob/simple/pets.dmi',
	AI_HOLOGRAM_CAT_2 = 'icons/mob/simple/pets.dmi',
	AI_HOLOGRAM_CHICKEN = 'icons/mob/simple/animal.dmi',
	AI_HOLOGRAM_CORGI = 'icons/mob/simple/pets.dmi',
	AI_HOLOGRAM_COW = 'icons/mob/simple/cows.dmi',
	AI_HOLOGRAM_CRAB = 'icons/mob/simple/animal.dmi',
	AI_HOLOGRAM_DEFAULT = 'icons/mob/silicon/ai.dmi',
	AI_HOLOGRAM_FACE = 'icons/mob/silicon/ai.dmi',
	AI_HOLOGRAM_FOX = 'icons/mob/simple/pets.dmi',
	AI_HOLOGRAM_GOAT = 'icons/mob/simple/animal.dmi',
	AI_HOLOGRAM_NARSIE = 'icons/mob/silicon/ai.dmi',
	AI_HOLOGRAM_PARROT = 'icons/mob/simple/animal.dmi',
	AI_HOLOGRAM_PUG = 'icons/mob/simple/pets.dmi',
	AI_HOLOGRAM_RATVAR = 'icons/mob/silicon/ai.dmi',
	AI_HOLOGRAM_SPIDER = 'icons/mob/simple/arachnoid.dmi',
	AI_HOLOGRAM_XENO = 'icons/mob/nonhuman-player/alien.dmi',
))

// New items need to also be added to ai_hologram_icons list
GLOBAL_LIST_INIT(ai_hologram_icon_state, list(
	AI_HOLOGRAM_BEAR = "bear",
	AI_HOLOGRAM_CARP = "carp",
	AI_HOLOGRAM_CAT = "cat",
	AI_HOLOGRAM_CAT_2 = "cat2",
	AI_HOLOGRAM_CHICKEN = "chicken_brown",
	AI_HOLOGRAM_CORGI = "corgi",
	AI_HOLOGRAM_COW = "cow",
	AI_HOLOGRAM_CRAB = "crab",
	AI_HOLOGRAM_DEFAULT = "default",
	AI_HOLOGRAM_FACE = "floating face",
	AI_HOLOGRAM_FOX = "fox",
	AI_HOLOGRAM_GOAT = "goat",
	AI_HOLOGRAM_NARSIE = "horror",
	AI_HOLOGRAM_PARROT = "parrot_fly",
	AI_HOLOGRAM_PUG = "pug",
	AI_HOLOGRAM_RATVAR = "clock",
	AI_HOLOGRAM_SPIDER = "guard",
	AI_HOLOGRAM_XENO = "alienq",
))

/// A form of resolve_ai_icon that is guaranteed to never sleep.
/// Not always accurate, but always synchronous.
/proc/resolve_ai_icon_sync(input)
	SHOULD_NOT_SLEEP(TRUE)

/proc/resolve_ai_icon(input)
	if (input == "Portrait")
		var/datum/portrait_picker/tgui = new(usr)//create the datum
		tgui.ui_interact(usr)//datum has a tgui component, here we open the window
		return "ai-portrait" //just take this until they decide

	return resolve_ai_icon_sync(input)
