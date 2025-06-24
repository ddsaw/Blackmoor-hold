/datum/ritual/initiation
	name = "The Initiation"
	tutorial = "Stand in the centre of the sigil."
	incantation = "Zaos Dei!"
	reagent_map = list(
		"W" = /obj/item/candle,
		"C" = /mob/living/carbon/human,
		"E" = /obj/item/candle,
	)
	consumption = TRUE

/datum/ritual/initiation/ritual_effects(var/list/reagents)
	. = ..()
	var/mob/living/carbon/human/convert = reagents["C"]
	if(convert.patron != /datum/patron/inhumen/zizo) //We can convert them!
		convert.set_patron(/datum/patron/inhumen/zizo)
		convert.say(incantation, forced = "ritual")
			var/list/shouts = list(
		'sound/vo/cult/cultist1.ogg',
		'sound/vo/cult/cultist2.ogg',
		'sound/vo/cult/cultist3.ogg',
		'sound/vo/cult/cultist4.ogg',
		'sound/vo/cult/cultist5.ogg',
		)
		playsound(convert.loc, pick(shouts), 100)

