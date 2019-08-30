sub EVENT_ITEM {
	#:: Turn in for 13844 -  Shiny Card for Series C Black Boxes Quest
	if (plugin::check_handin(\%itemcount, 13844 => 1)) {
		quest::say("Tick.. Pop.. Access granted.");
		#:: Give item 13212 - Blackbox XIIC
		quest::summonitem(13212);
		#:: Give a small amount of XP
		quest::exp(100);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(255,1); 		#:: + Gem Cutters
		quest::faction(245,1); 		#:: + Eldritch Collective
		quest::faction(333,1); 		#:: + King Ak'Anon
		quest::faction(238,-1); 		#:: - Dark Reflection
		quest::faction(287,-1); 	#:: - Clan Grikbar
	}
	plugin::return_items(\%itemcount);
}
