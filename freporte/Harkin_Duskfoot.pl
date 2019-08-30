sub EVENT_SPAWN {
	#:: Get current location
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	#:: Create a proximity, 30 units across, 30 units tall, and enable proximity say
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15, $z - 15, $z + 15, 1);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("HA! Greetings there. $name!  How are ya this fine day?  Me?  I'm doing all right.  Guard duty down here always reminds me of home.");
		#:: Send a signal "1" to East Freeport >> Beur_Tenlah (10106)
		quest::signalwith(10106,1,0)
	}
}

sub EVENT_PROXIMITY_SAY {
	if ($text=~/message/i) {
		quest::say("Ok, $name, I need you to take this message to Janam in West Freeport. He is usually hanging out in front of the Theater of the Tranquil with that good-for-nothing Rebby. Anyway, give this note to Janam and bring his reply back to me.");
		#:: Give item 18015 - Note to Janam
		quest::summonitem(18015);
	}
}

sub EVENT_SIGNAL {
	#:: Signal From freporte/Beur_Tenlah.pl
	if ($signal == 1) {
		quest::say("Bah! Don't listen to this fool. Listen, I've something a little more important for you to do than buy ales. I need you to take a [" . quest::saylink("message") . "] to my friend Janam over in West Freeport.");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 18016 -  Note to Harkin
	if (plugin::takeItems(18016 => 1)) {
		quest::say("Ah, good work, $name. And quick too, I'll makes sure that Elisi hears of your loyal work. Here... take this for your efforts.. it's not much, but it's all I have on me right now.");
		#:: Give item 1054 - Used Merchants Gloves
		quest::summonitem(1054);
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(100);
		#:: Create a hash for storing cash - 5 to 7cp
		my %cash = plugin::RandomCash(5,7);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Set factions
		quest::faction(229,1); 		#:: + Coalition of Trade Folk
		quest::faction(336,1); 		#:: + Coalition of Tradefolk Underground
		quest::faction(329,1); 		#:: + Carson McCabe
		quest::faction(230,1); 		#:: + Corrupt Qeynos Guards
		quest::faction(330,1); 		#:: + Freeport Militia
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
