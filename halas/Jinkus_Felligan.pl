sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [" . quest::saylink("new to the Shamans o' Justice") . "], then, eh?");
	}
	elsif ($text=~/new to the Shamans/i) {
		quest::say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye willing to [" . quest::saylink("contribute to our church") . "] or did ye just come to meditate within our walls?");
	}
	elsif ($text=~/contribute to our church/i) {
		quest::say("Ye'll help all o' Halas by doing the bidding o' this church. Go to Holana. Tell her Jinkus sent ye to assist her. She'll have work fer ye. Perhaps, if ye're planning on passing near Qeynos, ye can [" . quest::saylink("make a delivery") . "] as well?");
	}
	elsif ($text=~/make a delivery/i) {
		quest::say("The Church of the Tribunal works with the Qeynos Guards to apprehend fugitives. There's a new criminal on the loose, so we must send a wanted poster to Qeynos for them to display on the walls of their bank. Speak with Cindl about a piece o' mammoth hide parchment and with Greta Terrilon about some ink and I'll prepare the bounty poster.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12621 - Mammoth Hide Parchment and 12619 - Vial of Datura Ink
	if (plugin::takeItems(12621 => 1, 12619 => 1)) {
		quest::say("Here is th' bounty poster. Take it to a bank guard in Qeynos, immediately!");
		#:: Give a 12620 - Wanted Poster
		quest::summon(12620);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(327, 1); 	#:: + Shamen of Justice
		quest::faction(328, 1); 	#:: + Merchants of Halas
		quest::faction(223, -1); 	#:: - Circle Of Unseen Hands
		quest::faction(336, -1); 	#:: - Coalition of Tradefolk Underground
		quest::faction(244, -1); 	#:: - Ebon Mask
	}
	#:: Match a 12622 - List of Qeynos Most Wanted
	elsif (plugin::takeItems(12622 => 1)) {
		quest::say("Ye're learnin' to serve the church well, young Initiate $name. I grant ye yer holy symbol and the blessing o' the Tribunal that They may grant ye wisdom in serving Their will..");
		#:: Give a 1376 - Initiate Symbol of the Tribunal
		quest::summonitem(1376);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Set factions
		quest::faction(327, 25); 	#:: + Shamen of Justice
		quest::faction(328, 3); 	#:: + Merchants of Halas
		quest::faction(223, -3); 	#:: - Circle Of Unseen Hands
		quest::faction(336, -3); 	#:: - Coalition of Tradefolk Underground
		quest::faction(244, -5); 	#:: - Ebon Mask
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
