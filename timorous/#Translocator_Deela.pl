#REVISED: Angelox
#Zone: timorous
sub EVENT_SAY { 
    my $tButcher = quest::saylink("travel to Butcherblock");
    my $tOasis = quest::saylink("travel to Oasis");
    my $tOverthere = quest::saylink("travel to Overthere");
    my $tFiriona = quest::saylink("travel to Firiona");

    if ($text=~/Hail/i){quest::say("Hello there. Some of the boats are still unreliable. If you'd like to [$tButcher], [$tOverthere], [$tOasis], or [$tFiriona], I can teleport you to my companions there."); }

    if ($text=~/travel to butcherblock/i){quest::movepc(68,3093.10,854.26,11.4,424); quest::say("Off you go!");}
    if ($text=~/travel to overthere/i){quest::movepc(93,2731.76,3453,-158.0,257); quest::say("Off you go!");}
    if ($text=~/travel to oasis/i){quest::movepc(37,-844.15,886.15, 0.0, 132.2); quest::say("Off you go!"); }
    if ($text=~/travel to firiona/i){quest::movepc(84,1402.47,-4326.88,-103.0,510.2); quest::say("Off you go!");}
}
