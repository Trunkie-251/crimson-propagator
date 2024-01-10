/obj/item/organ/internal/stomach/synthetic
	name = "Microfusion Reactor"
	icon_state = "synth_fusion_reactor"
	desc = "A RZ-451 Technocracy micro-fusion reactor used to power all modern synthetics. Extremely heavy and not rated for organic use."
	metabolism_efficiency = 0.13 //Extremely efficient.
	maxHealth = 3 * STANDARD_ORGAN_THRESHOLD
	organ_flags = ORGAN_ROBOTIC|ORGAN_VITAL
	organ_traits = list(TRAIT_NOHUNGER)
