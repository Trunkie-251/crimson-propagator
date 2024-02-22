GLOBAL_DATUM(colored_assistant, /datum/colored_assistant)

/*
Assistant
*/
/datum/job/assistant
	title = JOB_ASSISTANT
	description = "Get your space legs, assist people, ask the HoP to give you a job."
	faction = FACTION_STATION
	total_positions = 5
	spawn_positions = 5
	supervisors = "absolutely everyone"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/assistant
	plasmaman_outfit = /datum/outfit/plasmaman
	synthetic_outfit = /datum/outfit/synthetic
	paycheck = PAYCHECK_LOWER // Get a job. Job reassignment changes your paycheck now. Get over it.

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_ASSISTANT

	liver_traits = list(TRAIT_MAINTENANCE_METABOLISM)

	department_for_prefs = /datum/job_department/assistant

	family_heirlooms = list(/obj/item/storage/toolbox/mechanical/old/heirloom, /obj/item/clothing/gloves/cut/heirloom)

	mail_goodies = list(
		/obj/effect/spawner/random/food_or_drink/donkpockets = 10,
		/obj/item/clothing/mask/gas = 10,
		/obj/item/clothing/gloves/color/fyellow = 7,
		/obj/item/choice_beacon/music = 5,
		/obj/item/toy/sprayoncan = 3,
		/obj/item/crowbar/large = 1
	)

	job_flags = STATION_JOB_FLAGS
	rpg_title = "Lout"
	config_tag = "ASSISTANT"

/datum/outfit/job/assistant
	name = JOB_ASSISTANT
	jobtype = /datum/job/assistant
	id_trim = /datum/id_trim/job/assistant
	uniform = /obj/item/clothing/under/syntech/coveralls
	belt = null
	organs = list(
		/obj/item/organ/internal/cyberimp/brain/neural_interface,
		)
