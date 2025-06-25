/datum/ritual/curse_the_nite
	name = "Curse the Nite"
	tutorial = "Place a heart in the centre. Surround it with candles."
	incantation = "Zizo! Curse this land!"
	reagent_map = list(
		"NW" = /obj/item/candle,
		"NE" = /obj/item/candle,
		"NE" = /obj/item/candle,
		"C" = /obj/item/organ/heart,
		"SE" = /obj/item/candle,
		"S" = /obj/item/candle,
		"SW" = /obj/item/candle,
	)
	consumption = TRUE

/datum/ritual/curse_the_nite/ritual_effects(var/list/reagents)
	. = ..()
	badomen(OMEN_CURSE)
	return
