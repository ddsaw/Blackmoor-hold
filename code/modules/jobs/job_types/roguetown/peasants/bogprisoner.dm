/datum/job/roguetown/prisonerb
	title = "Prisoner (Bog)"
	flag = PRISONERB
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 4

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "How does it feel to be the rat in the cage? You're alone and at the mercy of your captors, kept around as a hostage. You spend your days waiting for the oft chance someone comes to pay your ransom. Might as well start praying to whatever god you find solace in."

	outfit = /datum/outfit/job/roguetown/prisonerr
	bypass_jobban = TRUE
	display_order = JDO_PRISONERB
	give_bank_account = 10
	min_pq = -14
	max_pq = null
	can_random = FALSE

	cmode_music = 'sound/music/combat_bum.ogg'

	advclass_cat_rolls = list(CTAG_PRISONER = 20)

/datum/outfit/job/roguetown/prisonerr/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/collar
	pants = /obj/item/clothing/under/roguetown/loincloth
	shirt = null
	armor = null
	shoes = null

/datum/advclass/proc/pre_equip(mob/living/carbon/human/H)
	// Default does nothing. Subclasses override this.

// Prisoner-specific subclasses, inheriting from towner roles
/datum/advclass/prisoner_farmer
	parent_type = /datum/advclass/peasant
	name = "Prisoner Farmer"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_farmer/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("intelligence", -1)

/datum/advclass/prisoner_thug
	parent_type = /datum/advclass/thug
	name = "Prisoner Thug"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_thug/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/mining, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 3)
	H.change_stat("speed", -1)
	H.change_stat("intelligence", -1)
	H.grant_language(/datum/language/thievescant)

/datum/advclass/prisoner_carpenter
	parent_type = /datum/advclass/carpenter
	name = "Prisoner Carpenter"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_carpenter/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/traps, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", 1)
	H.change_stat("speed", -1)

/datum/advclass/prisoner_blacksmith
	parent_type = /datum/advclass/blacksmith
	name = "Prisoner Blacksmith"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_blacksmith/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/smelting, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)

/datum/advclass/prisoner_hunter
	parent_type = /datum/advclass/hunter
	name = "Prisoner Hunter"
	category_tags = list(CTAG_PRISONER)

/datum/advclass/prisoner_minstrel
	parent_type = /datum/advclass/minstrel
	name = "Prisoner Minstrel"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_minstrel/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.change_stat("speed", 1)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

/datum/advclass/prisoner_butcher
	parent_type = /datum/advclass/butcher
	name = "Prisoner Butcher"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_butcher/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/butchering, 5, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", -1)

/datum/advclass/prisoner_cheesemaker
	parent_type = /datum/advclass/cheesemaker
	name = "Prisoner Cheesemaker"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_cheesemaker/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/butchering, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 1)

/datum/advclass/prisoner_seamstress
	parent_type = /datum/advclass/seamstress
	name = "Prisoner Seamster"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_seamstress/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 2)
	H.change_stat("perception", 1)
	H.change_stat("strength", -1)

/datum/advclass/prisoner_potter
	parent_type = /datum/advclass/potter
	name = "Prisoner Potter"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_potter/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/masonry, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/ceramics, 5, TRUE)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", -1)

/datum/advclass/prisoner_towndoctor
	parent_type = /datum/advclass/towndoctor
	name = "Prisoner Barber Surgeon"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_towndoctor/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
	H.change_stat("intelligence", 3)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_NOSTINK)

/datum/advclass/prisoner_drunkard
	parent_type = /datum/advclass/drunkard
	name = "Prisoner Gambler"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_drunkard/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("intelligence", -2)
	H.change_stat("constitution", 1)
	H.change_stat("strength", 1)
	H.change_stat("fortune", 2)

/datum/advclass/prisoner_witch
	parent_type = /datum/advclass/witch
	name = "Prisoner Witch"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_witch/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_spellpoints(6)
	H.change_stat("intelligence", 3)
	H.change_stat("speed", 2)
	H.change_stat("fortune", 1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/crow)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance)

/datum/advclass/prisoner_miner
	parent_type = /datum/advclass/miner
	name = "Prisoner Miner"
	category_tags = list(CTAG_PRISONER)
/datum/advclass/prisoner_miner/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/engineering, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/mining, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/smelting, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	H.change_stat("fortune", 2)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)

/datum/advclass/prisoner_hunter/pre_equip(mob/living/carbon/human/H)
	if(!H) return
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/traps, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("intelligence", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
