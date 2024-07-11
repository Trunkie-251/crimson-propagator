#define DAMAGE_AMOUNT 20
#define SECONDS_PER_TICK SSmobs.wait / 10

/datum/unit_test/liver
	abstract_type = /datum/unit_test/liver

/datum/unit_test/liver/skeleton/Run()
	// Pause natural mob life so it can be handled entirely by the test
	SSmobs.pause()

	var/mob/living/carbon/human/species/skeleton/mrbones = allocate(/mob/living/carbon/human/species/skeleton)
	var/datum/reagent/toxin/bonehurtingjuice/bonehurting = /datum/reagent/toxin/bonehurtingjuice
	var/datum/reagent/consumable/milk/calcium = /datum/reagent/consumable/milk

	TEST_ASSERT(!isnull(mrbones.get_organ_by_type(/obj/item/organ/internal/liver/bone)), "Skeleton does not have a bone liver")
	TEST_ASSERT_EQUAL(mrbones.has_reagent(/datum/reagent/toxin/bonehurtingjuice), FALSE, "Skeleton somehow has bone hurting juice before drinking")
	TEST_ASSERT_EQUAL(mrbones.has_reagent(/datum/reagent/consumable/milk), FALSE, "Skeleton somehow has milk before drinking")

	// Test bone hurting juice reactions

	mrbones.reagents.add_reagent(bonehurting, 40)
	mrbones.Life(SSMOBS_DT)
	var/expected_stamina_damage = (7.5 * REM * SECONDS_PER_TICK)
	var/expected_brute_damage = (0.5 * REM * SECONDS_PER_TICK)

	TEST_ASSERT_EQUAL(mrbones.getStaminaLoss(), expected_stamina_damage,
		"Skeleton took [mrbones.getStaminaLoss() > expected_stamina_damage ? "more" : "less"] stamina damage than expected")
	TEST_ASSERT_EQUAL(mrbones.getBruteLoss(), expected_brute_damage,
		"Skeleton took [mrbones.getBruteLoss() > expected_brute_damage ? "more" : "less"] brute damage than expected")

	mrbones.reagents.remove_all(mrbones.reagents.total_volume)
	mrbones.fully_heal()
	TEST_ASSERT_EQUAL(mrbones.getStaminaLoss(), 0, "Skeleton did not fully heal stamina damage")
	TEST_ASSERT_EQUAL(mrbones.getBruteLoss(), 0, "Skeleton did not fully heal brute damage")

	// Test milk reactions

	mrbones.reagents.add_reagent(calcium, 51)
	mrbones.Life(SSMOBS_DT)
	TEST_ASSERT(mrbones.reagents.total_volume < 50, "Excess (>50u) milk did not leak out of skeleton")
	mrbones.reagents.remove_all(mrbones.reagents.total_volume)

	mrbones.apply_damage(DAMAGE_AMOUNT, def_zone = BODY_ZONE_CHEST)
	var/list/obj/item/bodypart/damaged_parts = mrbones.get_damaged_bodyparts(brute = TRUE)
	TEST_ASSERT(!isnull(damaged_parts), "Skeleton did not take any damage")
	TEST_ASSERT(length(damaged_parts) == 1, "Skeleton took damage to more than one body part")

	mrbones.reagents.add_reagent(calcium, 50)
	mrbones.Life(SSMOBS_DT)
	var/expected_remaining_damage = DAMAGE_AMOUNT - (2.5 * REM * SECONDS_PER_TICK)
	// Milk also heals brute on its own, so we may be more healed than expected
	TEST_ASSERT(damaged_parts[1].brute_dam <= expected_remaining_damage,
		"Milk did not heal the expected amount of damage (expected at least [expected_remaining_damage], got [damaged_parts[1].brute_dam])")

/datum/unit_test/liver/skeleton/Destroy()
	SSmobs.ignite()
	return ..()

#undef DAMAGE_AMOUNT
#undef SECONDS_PER_TICK
