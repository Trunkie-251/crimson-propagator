/datum/job/duke
	title = JOB_DUKE
	description = "Rule the Arcology with an iron first. Manage your subjects thoughtfully.\
	Or don't, it's your choice."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("The Consul")
	config_tag = "DUKE"
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Consul, and Imperial law."
	req_admin_notify = 1
	minimal_player_age = 14

	outfit = /datum/outfit/job/duke

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	family_heirlooms = list(/obj/item/reagent_containers/cup/glass/flask/gold, /obj/item/melee/energy/sword/dagger)

/datum/job/duke/get_captaincy_announcement(mob/living/duke)
	return "Duke [duke.real_name] is here."

/datum/outfit/job/duke
	name = "Duke"
	jobtype = /datum/job/duke

	id = /obj/item/card/id/advanced/gold
	id_trim = /datum/id_trim/job/captain
	uniform = /obj/item/clothing/under/rank/duke
	suit = /obj/item/clothing/suit/armor/vest/capcarapace
	backpack_contents = list(
		/obj/item/melee/baton/telescopic = 1,
		/obj/item/station_charter = 1,
		)

	belt = /obj/item/modular_computer/pda/heads/captain
	ears = /obj/item/radio/headset/heads/captain/alt
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/captain
	head = /obj/item/clothing/head/hats/caphat
	shoes = /obj/item/clothing/shoes/laceup


	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	messenger = /obj/item/storage/backpack/messenger/cap

	organs = list(
		/obj/item/organ/internal/cyberimp/brain/neural_interface,
		)


	accessory = /obj/item/clothing/accessory/medal/gold/captain
	chameleon_extras = list(
		/obj/item/gun/energy/e_gun,
		/obj/item/stamp/head/captain,
		)
	implants = list(/obj/item/implant/mindshield)
	skillchips = list(/obj/item/skillchip/disk_verifier)

