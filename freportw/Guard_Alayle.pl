sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, citizen! You should not be in the Militia House. These are restricted grounds. Please leave at once unless you have business here.");
	}
	elsif ($text=~/truth is good/i) {
		if ($class eq "Paladin") {
			quest::say("Ssshhh!! Pipe down. The others might hear you. You must have something for me. Kalatrina must have given you something if you serve the Hall of Truth. If you have nothing please leave. You will blow my cover.");
		}
	}	
}

sub EVENT_ITEM {
	#:: Turn in for 18817 - Sealed Letter
	if (plugin::takeItems(1797 => 1)) {
		if ($class eq "Paladin") {
			quest::say("This is not good news. I must leave immediately. Here. Take this to Kala.. I mean my father. I found it on the floor of Sir Lucan D'Lere's quarters. Thanks again, messenger. I got this just in time");
			#:: Ding!
			quest::ding();
			#:: Give a 18818 - A Tattered Flier
			quest::summonitem(18818);
			#:: Set factions
			quest::faction(311, 1);		#:: + Steel Warriors
			quest::faction(262, 1);		#:: + Guards of Qeynos
			quest::faction(230, -1);		#:: - Corrupt Qeynos Guards
			quest::faction(330, -1);	#:: - Freeport Militia
			quest::faction(281, 1);		#:: + Knights of Truth
			#:: Spawn Krazen Loosh
			quest::spawn2(9143,87,0,-154,-55,-10,128);
		}
		else {
			quest::say("I have no use for this item, $name. You can have it back.");
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}	

sub EVENT_SIGNAL { 
	#:: Receive Signal 1 from Krazen Loosh
	if ($signal == 1) {
		quest::say("Oh no!! It is too late!! Run!!");
		#Signal Krazen Loosh
		quest::signal(9143,1,30000); 
	}
}
