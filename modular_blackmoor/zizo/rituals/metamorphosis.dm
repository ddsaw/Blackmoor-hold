/datum/ritual/metamorphosis
	name = "Metamorphosis"
	tutorial = "Two Brothers must stand at the poles of the sigil. Candles will be festooned at the corners and our Hearts will extend to the East and West."
	incantation = "ZIZO!! Warp flesh into perfection!"
	reagent_map = list(
		"NW" = /obj/item/candle
		"N" = /mob/living/carbon/human,
		"NE" = /obj/item/candle,
		"W" = /obj/item/organ/heart
		"C" = /mob/living/carbon/human,
		"E" = /obj/item/organ/heart,
		"SW" = /obj/item/candle,
		"S" = /mob/living/carbon/human,
		"SE" = /obj/item/candle
	)

/datum/ritual/metamorphosis/ritual_effects(var/list/reagents)
	. = ..()
	var/mob/living/carbon/human/north_brother = reagents["N"]
	var/mob/living/carbon/human/south_brother = reagents["S"]
	var/mob/living/carbon/human/victim = reagents["C"]

	if(HAS_TRAIT(north_brother, TRAIT_CABAL) && HAS_TRAIT(south_brother, TRAIT_CABAL))
		north_brother.say("Behold the Perfect Shape of ZIZO!", forced = "ritual")
		south_brother.say("Behold the Perfect Shape of ZIZO!", forced = "ritual")
		victim.set_species(/datum/species/abomination)
		//You're beefy, but not the smartest.
		victim.STASTR = 20
		victim.STACON = 20
		victim.STAINT = 3
		victim.STAPER = 5
		victim.regenerate_icons()
		victim.name = "?!WHATISIT!?"
		return

