//List of Zizoic Rituals

/datum/ritual
	// Name of the ritual
	var/name
	//Tutorial that pops up when the ritual fails
	var/tutorial = "Place a heart in the centre of the sigil. There are such sights to show you."
	//What you shout when you perform the ritual
	var/incantation = "As above, so below!"
	//Reagents required for the ritual on each tile
	// The keys are obviously "NW", "N", "NE", "W", "C", "E", "SW", "S", "SE"
	//Example: reagent_map = list("NW" = /obj/item/reagent_container/food/heart, "C" = /obj/item/reagent_container/food/heart)
	var/list/reagent_map = list()
	//Does the ritual consume reagents?
	var/consumption = FALSE

//This checks that the ritual can be performed, and then performs it if so.
/datum/ritual/proc/ritual_check(turf/T, mob/living/cultist)
	//Mapping directions to our ritual reagent map
	var/list/sigil_map = list(
		"NW" = NORTHWEST,
		"N" = NORTH,
		"NE" = NORTHEAST,
		"W" = WEST,
		"E" = EAST,
		"SW" = SOUTHWEST,
		"S" = SOUTH,
		"SE" = SOUTHEAST
	)

	//Storing any reagents we find in a map so we can obliterate them later if consumption == TRUE
	var/list/found_reagents = list()

	for(var/dir in reagent_map)
		var/expected = reagent_map[dir]
		var/turf/sigil_tile = (dir == "C") ? T : get_step(T, sigil_map[dir])
		for(var/atom/movable/A in sigil_tile.contents)
			if(istype(A, expected))
				found_reagents[dir] = A
				break
	//Final validation check
	for (var/dir in reagent_map)
    	var/expected = reagent_map[dir]

   		var/found = found_reagents[dir]
    	if (!found || !istype(found, expected))
        	return FALSE  // Missing or incorrect item
	playsound(T.loc, 'sound/villain/rite_complete.ogg', 100, ignore_walls = FALSE)
	if (consumption)
		for (var/dir in found_reagents)
			var/atom/movable/A = found_reagents[dir]
			do_sparks(2, FALSE, A)
			qdel(A)
	return TRUE




