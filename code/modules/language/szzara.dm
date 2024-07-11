/datum/language/deep
	name = "Chth'koola"
	desc = "The language of the Szzara, distantly related the aquatic tongue of deep ancient creatures."
	key = "x"
	flags = TONGUELESS_SPEECH
	sentence_chance = 8
	space_chance = 95
	var/static/list/base_syllables = list(
		"t", "y", "l", "e", "i", "u", "t", "z", "a", "n", "ra", "cz", "tzz", "mm", "soggothm", "niggurath", "dumfet",
		"dagoth", "drya", "chthul", "yith", "ka", "plio", "pulgo", "dagosh", "xie", "yn", "yth", "giza", "ftaghn", "ito",
		"yug", "oth",
	)
	syllables = list(
		"ya", "mm", "na", "ish", "syha", "shub", "yom", "czare", "xx", "thi", "yyn", "bla", "leth",
		"yama", "crool", "ulla", "kkon", "raza", "nylar", "hotep", "ankh", "atef", "ba", "ka", "sza", "barque",
		"tee", "kemet", "aped", "ptah"
	)
	icon_state = "deep"
	default_priority = 15

/datum/language/deep/New()
	for(var/syllable in base_syllables) //we only do this once, since there's only ever a single one of each language datum.
		for(var/target_syllable in base_syllables)
			if(syllable != target_syllable) //don't combine with yourself
				if(length(syllable) + length(target_syllable) > 8) //if the resulting syllable would be very long, don't put anything between it
					syllables += "[syllable][target_syllable]"
				else if(prob(80)) //we'll be minutely different each round.
					syllables += "[syllable]'[target_syllable]"
				else if(prob(25)) //5% chance of - instead of '
					syllables += "[syllable]-[target_syllable]"
				else //15% chance of no ' or - at all
					syllables += "[syllable][target_syllable]"
	..()
