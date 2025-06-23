//Call to the Overlord! Speak the profane words! 

/mob/living/carbon/human/proc/praise_zizo()
	set name = "Call to Overlord!!"
	set category = "ZIZO"
	audible_message("\\[src] praises <span class='bold'>Zizo</span>!")
	var/list/shouts = list(
		'sound/vo/cult/cultist1.ogg',
		'sound/vo/cult/cultist2.ogg',
		'sound/vo/cult/cultist3.ogg',
		'sound/vo/cult/cultist4.ogg',
		'sound/vo/cult/cultist5.ogg',
	)
	playsound(src.loc, pick(shouts), 100)

/datum/status_effect/overlord
	id = "overlord"
	alert_type = /atom/movable/screen/alert/status_effect/overlord
	status_type = STATUS_EFFECT_UNIQUE
	effectedstats = list("strength" = 1)
	duration = 10 SECONDS

/datum/status_effect/overlord/on_apply()
	owner.add_stress(/datum/stressevent/overlord_heard)
	ADD_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/status_effect/overlord/on_remove()
	owner.remove_stress(/datum/stressevent/overlord_heard)
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/atom/movable/screen/alert/status_effect/overlord
	name = "ZIZO"
	desc = "ZIZO HEARS ME!"
	icon_state = "stressvg"

/datum/stressevent/overlord_heard
	stressadd = -5
	desc = span_boldgreen("Zizo hears me!")
	timer = 10 SECONDS

/obj/effect/decal/cleanable/zizo_sigil
	name = "necromantic sigil"
	icon_state = "center"
	icon = 'icons/roguetown/zizo/zizo_sigil.dmi'

/obj/effect/decal/cleanable/zizo_sigil/N
	icon_state = "N"

/obj/effect/decal/cleanable/zizo_sigil/NE
	icon_state = "NE"

/obj/effect/decal/cleanable/zizo_sigil/E
	icon_state = "E"

/obj/effect/decal/cleanable/zizo_sigil/SE
	icon_state = "SE"

/obj/effect/decal/cleanable/zizo_sigil/S
	icon_state = "S"

/obj/effect/decal/cleanable/zizo_sigil/SW
	icon_state = "SW"

/obj/effect/decal/cleanable/zizo_sigil/W
	icon_state = "W"

/obj/effect/decal/cleanable/zizo_sigil/NW
	icon_state = "NW"

/mob/living/carbon/human/proc/zizo_sigil()
	set name = "Draw Zizo Sigil"
	set category = "ZIZO"
	if(!bloody_hands)
		to_chat(src, "<span class='danger'>My digits need fresh blood to paint with.</span>")
		return
	var/turf/T = get_turf(src.loc)
	for(var/obj/A in T)
		if(istype(A, /obj/effect/decal/cleanable/zizo_sigil))
			to_chat(src, "<span class='danger'>There is already a sigil here!</span>")
			return
		if(A.density && !(A.flags_1 & ON_BORDER_1))
			to_chat(src, "<span class='danger'>I cannot draw a sigil here!</span>")
			return
	if(do_after(src, 5 SECONDS))
		var/obj/effect/decal/cleanable/zizo_sigil/centre 
		new centre(T)
		var/list/sigilDirs = list(
			"N" = /obj/effect/decal/cleanable/zizo_sigil/N,
			"NE" = /obj/effect/decal/cleanable/zizo_sigil/NE,
			"E" = /obj/effect/decal/cleanable/zizo_sigil/E,
			"SE" = /obj/effect/decal/cleanable/zizo_sigil/SE,
			"S" = /obj/effect/decal/cleanable/zizo_sigil/S,
			"SW" = /obj/effect/decal/cleanable/zizo_sigil/SW,
			"W" = /obj/effect/decal/cleanable/zizo_sigil/W,
			"NW" = /obj/effect/decal/cleanable/zizo_sigil/NW
		)

		for(var/i = 1; i <= GLOB.alldirs.len; i++)
			var/turf/floor = get_step(T, GLOB.alldirs[i])
			var/sigil = sigilDirs[i]
			new sigil(floor)

//Ancient code puts the work in for us. What a wonderful thing to have.
/mob/living/proc/on_trait_gain(trait, source)
	SEND_SIGNAL(src, COMSIG_TRAIT_GAIN, trait, source)
	switch(trait)
		if(TRAIT_CABAL)
			if(iscarbon(src))
				var/mob/living/carbon/human/H = src
				H.verbs |= /mob/living/carbon/human/proc/praise_zizo


/mob/living/proc/on_trait_loss(trait, source)
	SEND_SIGNAL(src, COMSIG_TRAIT_LOSS, trait, source)
	switch(trait)
		if(TRAIT_CABAL)
			if(iscarbon(src))
				var/mob/living/carbon/human/H = src
				H.verbs -= /mob/living/carbon/human/proc/praise_zizo
