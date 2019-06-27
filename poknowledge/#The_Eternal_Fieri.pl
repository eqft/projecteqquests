# #The_Eternal_Fieri.pl

sub TEFSetSkillIfValid {
    ($skill, $value) = @_;
    return if $value <= 0;
    return unless $client->CanHaveSkill($skill);

    my $maxSkill = $client->MaxSkill( $skill, $client->GetClass(), $ulevel );
    return unless $value <= $maxSkill && $value > $client->GetRawSkill($skill);

    $client->SetSkill( $skill, $value );
}

sub TEFSetSkillsNearMax {
    foreach my $skill (@_) {
        next unless $client->CanHaveSkill($skill);
        my $maxSkill = $client->MaxSkill( $skill, $client->GetClass(), $ulevel );
        my $skillValue = $maxSkill - 30;

        if ($skillValue > 0) {
            TEFSetSkillIfValid($skill, $skillValue);
        }
    }
}

sub TEFSetSkillsValue {
    my $value = pop(@_);
    foreach my $skill (@_) {
        TEFSetSkillIfValid($skill, $value);
    }
}

sub TEFGrantSkills {
    my @maxSkillNums = ((0..39), (41..42), (49..56), (58..58), (62..62), (70..75), (77..77));
    my @minSkillNums = ((48..48));
    my @specializationSkillNums = (43..47);

    TEFSetSkillsNearMax(@maxSkillNums);

    TEFSetSkillsValue(@minSkillNums, 1);

    TEFSetSkillsValue(40, 200);

    TEFSetSkillsValue(@specializationSkillNums, 50);
}

sub EVENT_SAY {
    my $npcname = $npc->GetCleanName();
    my $skills = quest::saylink("skills");
    
    if($text=~/hail/i) {
    	$client->Message(277, "$npcname says, 'Hello there $name.  Do you need help catching up with your [$skills]?'");
    }
    
    if($text=~/skills/i) {
        if ($ulevel < 34) {
            $client->Message(277, "$npcname says, 'You are not yet experienced enough for my help.'");
            return;
        }

    	$client->Message(277, "$npcname says, 'For 5000 platinum, I'll train your skills to an appropriate level.  Trade skills are above my pay grade, though.'");
    }
}

sub EVENT_ITEM {
    my $npcname = $npc->GetCleanName();

    if ($ulevel < 34) {
        $client->Message(277, "$npcname says, 'You are not yet experienced enough for my help.'");
    	plugin::return_items(\%itemcount);
        return;
    }

    if ($platinum >= 5000) {
        $client->Message(277, "$npcname whispers to you, 'Oh yeah lets turn this up a notch!'");
    	TEFGrantSkills();
    }

    plugin::return_items(\%itemcount);
}

