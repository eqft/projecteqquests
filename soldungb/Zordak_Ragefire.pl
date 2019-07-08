# NPC:32038 Zordak_Ragefire
# Implements classic behavior for the Cleric Epic Quest

my $zordak_turnin = 0;

sub EVENT_SPAWN {
    $zordak_turnin = 0;
    my $naggy = $entity_list->GetNPCByNPCTypeID(32040); # Lord_Nagafen
    if ($naggy) {
        quest::settimer("depop", 0.5);
    }
}

sub EVENT_TIMER {
    if ($timer eq "depop") {
        quest::stoptimer("depop");
        quest::depop_withtimer();
    }
}

sub EVENT_SAY {
    if (!$zordak_turnin && $text =~ /hail/i) {
        quest::emote("stares at you with unblinking eyes. A wide grin crosses Zordak's face and flames flicker in the depths of his eyes. 'Welcome to the new fortress of the Plasmatic Priesthood! It's a shame about Lord Nagafen's untimely death, really it is! Such a powerful and noble creature should not perish at the hands of mortals.'");
    }
}

sub EVENT_ITEM {
    if (!$zordak_turnin && plugin::check_handin(\%itemcount, 28054 => 1)) {
        $zordak_turnin = 1;
        quest::say("Ah! You seek the elder dragon, $name? Very well, I hope you are prepared.");
        quest::ding();
        quest::moveto(-825.85, -1398.2, 88.3, 1, 1);
    }

    plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT_ARRIVE {
    #quest::spawn2(91090, 0, 0, -825.85, -1398.2, 88.3, 1);
    quest::spawn_from_spawn2(76589903); # Has despawn timer
    quest::depop_withtimer();
}


# END NPC:32038 Zordak_Ragefire
