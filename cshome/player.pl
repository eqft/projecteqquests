
sub EVENT_SIGNAL {
    if ($signal == 99597) {
        quest::settimer(99597, 0.03);
    } elsif ($signal == 99598) {
        quest::settimer(99598, 0.03);
    } elsif ($signal == 99599) {
        quest::settimer(99599, 0.03);
    }
}

sub EVENT_TIMER {
    if ($timer == 99597) {
        quest::stoptimer(99597);
        $client->SetTexture(3);
    } elsif ($timer == 99598) {
        quest::stoptimer(99598);
        $client->SetTexture(1);
    } elsif ($timer == 99599) {
        quest::stoptimer(99599);
        $client->SetTexture(2);
    }
}

