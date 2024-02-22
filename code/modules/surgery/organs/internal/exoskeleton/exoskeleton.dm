/obj/item/organ/internal/exoskeleton
    name = "exoskeleton"
    desc = "An exoskeleton to be grafted onto machine frames."
    icon_state = "implant-reinforcers"
    visual = TRUE
    maxHealth = 1.5 * STANDARD_ORGAN_THRESHOLD
    w_class = WEIGHT_CLASS_HUGE
    organ_flags = ORGAN_ROBOTIC //Exoskeletons are an overlay type for both synths and cyborgs.
    zone = BODY_ZONE_CHEST
