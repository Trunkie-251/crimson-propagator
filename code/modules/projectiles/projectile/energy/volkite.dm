/obj/projectile/beam/volkite
	damage = 30
	/// How many firestacks to apply to the target
	var/fire_stacks = 4
	/// If TRUE, leaves a trail of hotspots as it flies, very very chaotic
	var/leaves_fire_trail = TRUE

/obj/projectile/beam/volkite/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.ignite_mob()

/obj/projectile/beam/volkite/Move()
	. = ..()

	if(!leaves_fire_trail)
		return
	var/turf/location = get_turf(src)
	if(location)
		new /obj/effect/hotspot(location)
		location.hotspot_expose(700, 50, 1)

