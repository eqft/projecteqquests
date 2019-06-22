sub EVENT_AGGRO {
    local $x = $npc->GetX();
    local $y = $npc->GetY();
    local $z = $npc->GetZ();
    return if ($x == undef || $y == undef || $z == undef);

    local $dist =$client->CalculateDistance($x, $y, $z);

    if ($dist > 500) {
        $client->Message(0, 'You shudder as a feeling of danger washes over you.');
        $npc->WipeHateList();
        quest::signalwith($npc->GetNPCTypeID(), 'wipeHate', 1);
    }
}

sub EVENT_SIGNAL {
    if ($signal == "wipeHate") {
        $npc->WipeHateList();
    }
}
