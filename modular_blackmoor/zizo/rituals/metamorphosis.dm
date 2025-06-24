/datum/ritual/metamorphosis
	name = "Metamorphosis"
	tutorial = "Stand in the centre of the sigil."
	incantation = "ZIZO!! Warp flesh into perfection!"
	reagent_map = list(
		"C" = /mob/living/carbon/human,
	)

/datum/ritual/metamorphosis/ritual_effects(var/list/reagents)
	. = ..()
	var/mob/living/carbon/human/victim = reagents["C"]
	victim.set_species(/datum/species/abomination)
	//You're beefy, but not the smartest.
	if(victim.STASTR < 11)
		victim.STASTR = 14
	victim.STACON = 20
	victim.STAINT = 3
	victim.STASPD = 20
	victim.regenerate_icons()
	victim.name = "???"
	return

