sub EVENT_SPAWN {
	#:: Create a proximity, 200 units across
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	#:: Enable proximity Say
	quest::enable_proximity_say();
}

sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings and salutations, $name! My name is Reebo Leafsway, loyal Druid of [" . quest::saylink("Karana") . "]. I am in charge of helping young druids who wish to get started down the [" . quest::saylink("trail to Karana's wisdom") . "]. I also do my share of tending the [" . quest::saylink("crops") . "].");
	}
	elsif ($text=~/^karana$/i) {
		quest::say("Karana is known as the Rainkeeper. It is through His will that our [" . quest::saylink("crops") . "] and our children grow big and healthy. He watches over us and protects us, calling down the fury of a tempest on those who wish harm upon His followers.");
	}
	elsif ($text=~/trail to karana's wisdom/i) {
		quest::say("Good. First you should learn that Karana's work is just that.. work. Karana provides us with the tools but it is by the sweat of our brows that we prosper. Common sense and hard work are two things that are highly prized by our people. Time for you to sweat, young one. Take this crate of carrots over to Blinza Toepopal in the Fool's Gold. They need our finest carrots for Mayor Gubbin's stew. When you return I will teach you a lesson of the Rainkeeper.");
		#:: Give a 13971 - Crate of Rotten Carrots
		quest::summonitem(13971);
	}
	elsif ($text=~/crops/i) {
		quest::say("The crops we grow here are mostly carrots, lettuce and squash. We also are the only place on all of Norrath where the soil can support the mystical Jumjum Stalk.");
	}
	elsif ($text=~/nillipuss/i) {		
		quest::say("Nillipuss? Oh that dirty brownie keeps stealing our jumjum for his own greedy uses. We certainly would not mind if someone taught him a painful [" . quest::saylink("lesson") . "]?");
	}
	elsif ($text=~/lesson/i) {
		quest::say("He needs to be taught not to steal our jumjum! If you find some jumjum on him, I would appreciate it if you would return it to me.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13971 - Crate of Rotten Carrots
	if (plugin::takeItems(13971 => 1)) {
		quest::say("Very good. Very good indeed. Karana does not need the blind obedience that so many deities require. Trust your instincts, they are more often right than not. Here, take this to Blinza. Hurry, she is expecting them. You may keep the donation she gives you in return.");
		#:: Give a 13957 - Crate of Fine Carrots
		quest::summonitem(13957);
		#:: Ding!
		quest::ding();
	}
	#:: Match a 13972 - Crate of Rotten Carrots
	elsif (plugin::takeItems(13972 => 1)) {
		quest::say("These carrots are rotten. They were rotten when I gave them to you. Why would you waste time and energy on such a fool's errand? Because I asked you to? Many, even those you trust will ask you to do things which you should not. Use the common sense that Karana has blessed you with to know which tasks can benefit our people and which could harm them. Learn this lesson well. You will need it if you plan to adventure beyond the vale. Now take these fresh carrots to Blinza and apologize for your error. You may keep the donation she gives you as payment.");
		#:: Give a 13958 - Crate of Carrots
		quest::summonitem(13958);
		#:: Ding!
		quest::ding();
	}
	#:: Match four 13974 - Jumjum Stalk
	elsif (plugin::takeItems(13974 => 4)) {
		quest::say("Excellent!!  You must have taught ol' Nillipuss a great deal!  But he never seems to learn..  Oh well.  The Stormreapers and all of Rivervale owe you a debt of gratitude.  Please accept this token of our appreciation.");
		#:: Give a random reward:  10308 - Anti-Poison Amulet, 8303 - Arrow of Contagion, 8304 - Arrow of Frost, 10302 - Earring of Disease Reflection, 10303 - Earring of Fire Reflection, 10304 - Earring of Frost Reflection, 10305 - Earring of Magic Reflection
		#:: 10306 - Earring of Poison Reflection, 10309 - Eye of Disvan, 17302 - Pierce's Pouch of Storing, 12001 - Rod of Identification, 10301 - Runners Ring, 17301 - Travelers Pack, 17300 - Travelers Pouch, 12002 - Wand of Frost Bolts
		quest::summonitem(quest::ChooseRandom(10308,8303,8304,10302,10303,10304,10305,10306,10309,17302,12001,10301,17301,17300,12002));
		#:: Ding!
		quest::ding();
		#:: Grant a large amount of experience
		quest::exp(27440);
		#:: Create a hash for storing cash - 1600 to 2500cp
		my %cash = plugin::RandomCash(1600,2500);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Set factions
		quest::faction(316, 10);	#:: + Storm Reapers
		quest::faction(208, 1);		#:: + Mayor Gubbin
		quest::faction(218, 1);		#:: + Merchants of Rivervale
		quest::faction(347, -1);	#:: - Unkempt Druids
	}
	#:: Match three 13974 - Jumjum Stalk
	elsif (plugin::takeItems(13974 => 3)) {
		quest::say("Oh good! I see you have taugh that nasty Nillipuss a thing or two! Good. But it seems to me that he has stolen more jumjum than this. Perhaps he needs another lesson?");
		#:: Give a 13974 - Jumjum Stalk
		quest::summonitem(13974);
		#:: Give a 13974 - Jumjum Stalk
		quest::summonitem(13974);
		#:: Give a 13974 - Jumjum Stalk
		quest::summonitem(13974);
	}
	#:: Match two 13974 - Jumjum Stalk
	elsif (plugin::takeItems(13974 => 2)) {
		quest::say("Oh good! I see you have taugh that nasty Nillipuss a thing or two! Good. But it seems to me that he has stolen more jumjum than this. Perhaps he needs another lesson?");
		#:: Give a 13974 - Jumjum Stalk
		quest::summonitem(13974);
		#:: Give a 13974 - Jumjum Stalk
		quest::summonitem(13974);
	}
	#:: Match two 13974 - Jumjum Stalk
	elsif (plugin::takeItems(13974 => 1)) {
		quest::say("Oh good! I see you have taugh that nasty Nillipuss a thing or two! Good. But it seems to me that he has stolen more jumjum than this. Perhaps he needs another lesson?");
		#:: Give a 13974 - Jumjum Stalk
		quest::summonitem(13974);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 12 || $wp == 33 || $wp == 51 || $wp == 73 || $wp == 96 || $wp == 120) {
		quest::emote("whistles a happy hafling tune.");
	}
}

sub EVENT_SIGNAL { 
	#::Receive Signal 1 from Shakey Scarecrow - Rivervale
	if ($signal == 1) {
		quest::emote("Reebo Leafsway shakes his head sadly. 'Poor old  [" . quest::saylink("Shakey") . "] just isn't what he used to be.' ");
	}
}

sub EVENT_PROXIMITY_SAY {
	if ($text=~/Shakey/i) {	
		quest::say("Shakey is our protector and friend. He is just getting old. Losing his [" . quest::saylink("stuffing") . "]. His head is getting very cracked and dry as well.");
	}
	elsif ($text=~/stuffing/i) {
		quest::say("The hay he requires is difficult to obtain. It must have been harvested from the Plains of Karana, then cursed by a high priest of the Faceless, [" . quest::saylink("Cazic-Thule") . "]. Finally, you must cast the hay and a flask of blessed Oil of Life into an armorer's forge. Only then will the hay be ready. We Stormreapers will reward you greatly if you could accomplish this task. Remember, you must give the scarecrow stuffing to Shakey only after it has been properly prepared.");
	}
	elsif ($text=~/Cazic-Thule/i) {
		quest::say("Cazic-Thule is the dark deity of fear. He is worshiped by many evil beings. There is believed to be a ruined temple dedicated to him deep in the [" . quest::saylink("Feerrott") . "]. That would be a good place to look for one of his high priests.");
	}
	elsif ($text=~/Feerrott/i) {
		quest::say("The Feerrott is a vast rain forest in southwestern Antonica. It is home to many lizardman tribes.");
	}
}
