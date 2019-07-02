
sub EVENT_ENTERZONE {
    my $instancetime = quest::GetInstanceTimer(); # in MS
    # Randomly boot PCs in the last 40s before instance expires
    my $exitTime = $instancetime - (10000 + int(rand(30000)));
    quest::settimer("exitInstance", $exitTime);
}

sub EVENT_TIMER {
    quest::debug("timer: $timer");
    if ($timer eq "exitInstance" && !$client->GetAdmin()) {
        quest::stoptimer("exitInstance");
        quest::emote("is consumed by swirling darkness.");
        quest::RemoveFromInstance($instanceid);
        quest::movepc(47, 2372.93, -2183.8, 4, 170); # Feerrott
    }
}

