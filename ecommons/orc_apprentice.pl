sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("You shall bleed!! All hail the Deathfist!!");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Tell my mother i died protecting our lands she's in the abandoned hut in kithicors forest.");
}
