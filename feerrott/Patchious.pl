
sub EVENT_SPAWN {
    quest::ze(15, 'A scream pierces your mind.');
}

sub EVENT_SAY {
    return unless ($ulevel > 45);

    my $npcname = $npc->GetCleanName;
    my $raid = $client->GetRaid();
    my $group_id = plugin::GetGroupID();
    quest::debug("group: $group_id");
    if (!$raid && !$group_id) {
        $client->Message(15, "$npcname rolls its eyes at you and says, 'You must be in a group or a raid.'");
        return;
    }
    
    if ($text =~ /little death/i) {
        if ($raid) {
            plugin::SendToInstance("raid", "fearplane", 1, -1, -1, -1, "Epics", 345600);
        } else {
            plugin::SendToInstance("group", "fearplane", 1, -1, -1, -1, "Epics", 345600);
        }
    } elsif ($text =~ /hail/i) {
        my $littledeath = quest::saylink("little death");
        $client->Message(15, "#npcname says, 'Hello, mortal one.  For a simplified version of Fear for epic quest encounters, just ask me for the [$littledeath].'");
    }
}

