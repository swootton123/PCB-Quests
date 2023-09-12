sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("For the glory of the Deathfist Magistrate, your blood shall run!!");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Tell my family I love them.");
}
