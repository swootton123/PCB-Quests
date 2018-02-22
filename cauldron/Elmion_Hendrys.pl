sub EVENT_SAY {
     if ($text=~/hail/i) {
		if ($faction > 4) {
			quest::say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
		} else {
			quest::say("How are you? Please rest. Have you [" . quest::saylink("been wounded by the beasts") . "] of this region.");
			}
			if ($text=~/been wounded by the beasts/i) {
			quest::say("Ah. Perhaps you should speak with Nyrien. Just inform him you [need to be healed].");
			}
			if ($text=~/faldor hendrys/i) {
			quest::say("Ha!! You seek my foul brother, Faldor Hendrys?!! He is my half brother and has left to live with the vile half of his ancestry in Qeynos. No doubt he has decided to lend his talents to the local thieves' guild. Good luck finding him.");
			}
     }
}
sub EVENT_SIGNAL {
	quest::say("Pipe down, Ghil!! We have no quarrel with this adventurer."); #:: Signal from Ghilanbiddle Nylwadil
	quest::signal(70005,5);

   plugin::return_items(\%itemcount);
}

# Converted to Perl by SS 
