sub EVENT_SAY { 
    my $tTimorous = quest::saylink("travel to Timorous");

    if ($text=~/Hail/i){quest::say("Hello there. There seems to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [$tTimorous] in the meantime, I can transport you to my companion there."); }

    if ($text=~/travel to timorous/i){
    quest::movepc(96,-3260.10,-4544.56,19.47); quest::say("Off you go!"); }
}
