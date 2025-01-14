// Auto-retaliates against melee attacks.  Weak to projectiles.
/datum/blob_type/reactive_spines
	name = "reactive spines"
	desc = "An ever-growing lifeform with a large amount of sharp, powerful looking spines.  They look like they could pierce most armor."
	ai_desc = "defensive"
	effect_desc = "When attacked by a melee weapon, it will automatically retaliate, striking the attacker with an armor piercing attack.  \
	The blob itself is rather weak to all forms of attacks regardless, and lacks automatic realitation from ranged attacks."
	difficulty = BLOB_DIFFICULTY_EASY // Potentially deadly to people not knowing the mechanics, but otherwise fairly tame, due to its slow spread and weakness.
	color = "#9ACD32"
	complementary_color = "#FFA500"
	damage_type = BRUTE
	damage_lower = 30
	damage_upper = 40
	armor_pen = 50 // Even with riot armor and tactical jumpsuit, you'd have 90 armor, reduced by 50, totaling 40.  Getting hit for around 21 damage is still rough.
	burn_multiplier = 2.0
	brute_multiplier = 2.0
	spread_modifier = 0.35 // Ranged projectiles tend to have a higher material cost, so ease up on the spreading.
	ai_aggressiveness = 40
	chunk_passive_ability_cooldown = 0.5 SECONDS
	attack_message = "The blob stabs you"
	attack_message_living = ", and you feel sharp spines pierce your flesh"
	attack_message_synth = ", and your external plating is pierced by sharp spines"
	attack_verb = "stabs"
	spore_projectile = /obj/item/projectile/bullet/thorn

// Even if the melee attack is enough to one-shot this blob, it gets to retaliate at least once.
/datum/blob_type/reactive_spines/on_received_damage(var/obj/structure/blob/B, damage, damage_type, mob/living/attacker)
	if(damage > 0 && attacker && get_dist(B, attacker) <= 1)
		B.visible_message("<span class='danger'>The [name] retaliates, lashing out at \the [attacker]!</span>")
		B.blob_attack_animation(attacker, B.overmind)
		attacker.blob_act(B)
	return ..()
