/datum/job/lawyer
	title = JOB_LAWYER
	description = "Advocate for prisoners, create law-binding contracts, \
		ensure Security is following protocol and Space Law."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = SUPERVISOR_HOP
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "LAWYER"
	required_character_age = 25

	outfit = /datum/outfit/job/lawyer
	plasmaman_outfit = /datum/outfit/plasmaman/bar
	synthetic_outfit = /datum/outfit/synthetic

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SRV

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_LAWYER
	departments_list = list(
		/datum/job_department/service,
		)
	rpg_title = "Magistrate"
	family_heirlooms = list(/obj/item/gavelhammer, /obj/item/book/manual/wiki/security_space_law)

	job_flags = STATION_JOB_FLAGS

	job_tone = "objection"


/datum/outfit/job/lawyer
	name = "Lawyer"
	jobtype = /datum/job/lawyer

	id_trim = /datum/id_trim/job/lawyer
	suit = /obj/item/clothing/suit/toggle/lawyer
	belt = /obj/item/modular_computer/pda/lawyer
	ears = /obj/item/radio/headset/headset_srvsec
	shoes = /obj/item/clothing/shoes/laceup
	neck = /obj/item/clothing/neck/tie/red/tied
	l_pocket = /obj/item/laser_pointer/red
	r_pocket = /obj/item/clothing/accessory/lawyers_badge
	l_hand = /obj/item/storage/briefcase/lawyer

	organs = list(
		/obj/item/organ/internal/cyberimp/brain/neural_interface,
		)


	chameleon_extras = /obj/item/stamp/law

/datum/outfit/job/lawyer/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return ..()

	var/static/use_purple_suit = FALSE //If there is one lawyer, they get the default blue suit. If another lawyer joins the round, they start with a purple suit.
	if(use_purple_suit)
		uniform = /obj/item/clothing/under/rank/civilian/lawyer/purpsuit
		suit = /obj/item/clothing/suit/toggle/lawyer/purple
	else
		use_purple_suit = TRUE
	..()

/datum/outfit/job/lawyer/get_types_to_preload()
	. = ..()
	. += /obj/item/clothing/under/rank/civilian/lawyer/purpsuit
	. += /obj/item/clothing/suit/toggle/lawyer/purple
