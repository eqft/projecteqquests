#--------------------
# SCRIPT CONFIG
#--------------------

# Zone version
my $INSTANCE_ZONE     = "airplane";
my $INSTANCE_ZONE_NUM = 71;
my $INSTANCE_VERSION  = 1;

# Number of seconds before a new instance is automatically destroyed
my $INSTANCE_LIFETIME = 38400; # 8 hours 

# Number of seconds until a PC can be assigned to a new copy of this instance.
# Must be greater than the instance lifetime.  If it is not, then this setting
# is ignored and $INSTANCE_LIFETIME is used instead.
my $INSTANCE_LOCKOUT  = 537600; # 1 week

# Zone in location inside the instance. Set to -1,-1,-1 to use the safe point.
my $ENTER_X = 1221.95;
my $ENTER_Y = -919.73;
my $ENTER_Z = 409; 
my $ENTER_HEADING = 462;

# SW corner of a 30x30 area into which corpses will be summoned.
# Set to 0,0,0 to summon corpses to the PC's location.
my $GRAVEYARD_X = 1147.54;
my $GRAVEYARD_Y = 5819.65;
my $GRAVEYARD_Z = 173.4;

# Data bucket key for lockout timer.  CharID is appended.
my $LOCKOUT_KEY = sprintf("%s-v%s-%s", $INSTANCE_ZONE, $INSTANCE_VERSION, "WarriorEpic");

# The time zone in which to report lockouts
my $TZ = "America/New_York";

# Are solo players allowed?
my $SOLO_ALLOWED = 0;

# Text triggers
my $TRIGGER_INFO    = "hail";
my $TRIGGER_ENTER   = "seek the wingblade";
my $TRIGGER_CORPSE  = "corpse";
my $TRIGGER_REFRESH_RE = "add|refresh|flag|reflag|update";

#--------------------
# NPC RESPONSES
#--------------------

# Response to $TRIGGER_INFO (hail)
sub MESSAGE_INFO {
    my $slEnter = quest::saylink($TRIGGER_ENTER);
    my $slCorpse = quest::saylink($TRIGGER_CORPSE);
    $client->Message(15, "$npcname says, 'Hello, traveler. If you [$slEnter] of the spirocs, I have discovered a way into their armory.'");
    $client->Message(257, "$npcname whispers, 'If you have lost a [$slCorpse], I can try and retrieve it.'");
}

# Shown when a solo player attempts to enter
sub MESSAGE_SOLO_PROHIBITED {
    $client->Message(15, "$npcname asks, 'It is not safe to go alone.'");
}

# General failure response
sub MESSAGE_NOT_ALLOWED {
    $client->Message(15, "$npcname looks at you and curtly shakes her head.");
}

# Instances prohibit entry during the last 2m before they expire or if locked.
sub MESSAGE_ENTRY_PROHIBITED {
    $client->Message(15, "$npcname says, 'I can no longer reach the armory with my limited magic.'");
}

# Shown when a player asks for corpses but has none to summon.
sub MESSAGE_CORPSE_HELP {
    $client->Message(14, "Corpses can only be summoned after your instance expires or is destroyed.  For help with a lost or missing corpse, just /tell any visible Guide/GM or post in #help on Discord.");
}

# Player has eligible corpses and we are summoning one
sub MESSAGE_SUMMON_CORPSE {
    quest::emote("suddenly grabs $name by the wrist and shudders, then releases them.");
}

# After summoning a PC corpse
sub MESSAGE_AFTER_SUMMON_CORPSE {
    quest::doanim(83);
    $client->Message(15, "$npcname gestures towards your corpse.");
}

# After instance flags are refeshed
sub MESSAGE_FLAGS_REFRESHED {
    quest::emote("nods at $name.");
}

# If a PC attempts to enter but is locked out
sub MESSAGE_LOCKEDOUT {
    my $expTime = GetPlayerLockout();
    my $timeDesc = localtime($expTime);
    my $d = plugin::GetTimeLeft($expTime, "D");
    my $h = plugin::GetTimeLeft($expTime - ($d*86400), "H");
    my $m = plugin::GetTimeLeft($expTime - ($d*86400 + $h*3600), "M");
    my $timeLeft = "$d days, $h hours, $m minutes";
    $client->Message(14, "Your lockout for this instance expires in $timeLeft (at $timeDesc ET).");
}

#--------------------
# END SCRIPT CONFIG
#--------------------


# Set time zone
use POSIX qw(tzset);
$ENV{TZ} = $TZ;
tzset;

sub EVENT_SAY {
    return unless ($ulevel > 45);

    local $npcname = $npc->GetCleanName();

    # Hail (info)
    if ($text =~ /$TRIGGER_INFO/i) {
        MESSAGE_INFO;
    }

    # Enter Instance
    elsif ($text =~ /$TRIGGER_ENTER|enter/i) {
        my $group = $client->GetGroup();
        my $raid = $client->GetRaid();
        $raid = undef if ($raid && $raid->RaidCount() < 2); # Detect solo players who happen to still be in a raid
        my $isSolo = (!$raid && !$group);

        if ($status < 50 && !$SOLO_ALLOWED && $isSolo) {
            MESSAGE_SOLO_PROHIBITED;
            return;
        }
        
        # Check for existing flag
        my $instid = GetCurrentInstanceID();
        if ($instid > 0) {
            if (InSameInstanceAsLeader($raid, $group)) {
                ENTER_INSTANCE($instid);
            } else {
                $client->Message(14, "You are still assigned to a different instance.");
                MESSAGE_LOCKEDOUT();
                # Use a visible emote so other nearby players can notice the problem
                quest::emote("looks at $name and shakes her head.");
            }
            return;
        }

        # Player is not flagged
        
        # Lockout enforcement
        if (IsLockedOut()) {
            MESSAGE_NOW_ALLOWED();
            MESSAGE_LOCKEDOUT();
            return;
        }

        if ($raid) {
            if ($raid->IsLeader($name)) {
                CREATE_INSTANCE($raid, $group);
            } else {
                quest::FlagInstanceByRaidLeader($INSTANCE_ZONE_NUM, $INSTANCE_VERSION);
            }
        } elsif ($group) {
            if ($group->IsLeader($client)) {
                CREATE_INSTANCE($raid, $group);
            } else {
                quest::FlagInstanceByGroupLeader($INSTANCE_ZONE_NUM, $INSTANCE_VERSION);
            }
        } elsif ($status > 20) {
            CREATE_INSTANCE();
        }

        $instid = GetCurrentInstanceID();
        if ($instid) {
            ENTER_INSTANCE($instid);
        } else {
            MESSAGE_NOT_ALLOWED;
        }
    } 

    # Refresh instance flags in case of problem
    elsif ($text =~ /$TRIGGER_REFRESH_RE/i) {
        my $instid = GetCurrentInstanceID();
        if (!$instid) {
            MESSAGE_NOT_ALLOWED;
            return;
        }

        my $group = $client->GetGroup();
        my $raid = $client->GetRaid();

        if ($raid && $raid->IsLeader($name)) {
            quest::AssignRaidToInstance($instid);
            MESSAGE_FLAGS_REFRESHED;
        } elsif ($group && $group->IsLeader($client)) {
            quest::AssignGroupToInstance($instid);
            MESSAGE_FLAGS_REFRESHED;
        } else {
            MESSAGE_NOT_ALLOWED;
        }
    }

    # Summon Corpse
    elsif ($text =~ /$TRIGGER_CORPSE/i) {
        my $corpse_count = quest::getplayerburiedcorpsecount($charid);
        if ($corpse_count > 0) {
            # Determine location for the corpse
            my $graveX, $graveY, $graveZ;
            if ($GRAVEYARD_X == 0 && $GRAVEYARD_Y == 0 && $GRAVEYARD_Z == 0) {
                $graveX = $client->GetX();
                $graveY = $client->GetY();
                $graveZ = $client->GetZ();
            } else {
                $graveX = $GRAVEYARD_X + rand(30);
                $graveY = $GRAVEYARD_Y + rand(30);
                $graveZ = $GRAVEYARD_Z;
            }

            MESSAGE_SUMMON_CORPSE;
            quest::summonburiedplayercorpse($charid, $graveX, $graveY, $graveZ, int(rand(490)));
            MESSAGE_POST_SUMMON_CORPSE;
        } else {
            MESSAGE_NOT_ALLOWED;
            MESSAGE_CORPSE_HELP;
        }
    }
}

sub CREATE_INSTANCE {
    my ($raid, $group) = @_;
    my $instid = quest::CreateInstance($INSTANCE_ZONE, $INSTANCE_VERSION, $INSTANCE_LIFETIME);
    if ($instid) {
        SaveInstanceCreated($instid, time);

        quest::AssignToInstance($instid);
        quest::AssignRaidToInstance($instid)  if ($raid);
        quest::AssignGroupToInstance($instid) if ($group);

        ENTER_INSTANCE($instid);
    }
}

sub ENTER_INSTANCE {
    my $instid = shift || GetCurrentInstanceID();
    return unless ($instid > 0);

    my $itimer = quest::GetInstanceTimerByID($instid);
    if ($itimer > 120) { # 2 minutes 
        SavePlayerLockout();
        $client->MovePCInstance($INSTANCE_ZONE_NUM, $instid, $ENTER_X, $ENTER_Y, $ENTER_Z, $ENTER_HEADING);
    } 
    else {
        MESSAGE_ENTRY_PROHIBITED;
    }
}

sub GetCurrentInstanceID {
    return int(quest::GetInstanceID($INSTANCE_ZONE, $INSTANCE_VERSION) || 0);
}

sub GetInstanceCreated {
    my $instid = shift || GetCurrentInstanceID();
    return 0 unless ($instid);
    my $created = quest::get_data("$LOCKOUT_KEY-$instid-created") || EstimateInstanceCreated($instid);
    return $created;
}

sub SaveInstanceCreated {
    my ($instid, $created) = @_;

    $created ||= EstimateInstanceCreated($instid);

    quest::set_data("$LOCKOUT_KEY-$instid-created", $created, $created + $INSTANCE_LIFETIME - time);
    return $created;
}

sub EstimateInstanceCreated {
    my $instid = shift || GetCurrentInstanceID();
    return 0 unless ($instid);
    my $timeleft = quest::GetInstanceTimerByID($instid);
    return time - ($INSTANCE_LIFETIME - $timeleft);
}

sub GetPlayerLockout {
    my $pcLockoutKey = "$LOCKOUT_KEY-$charid";
    return quest::get_data($pcLockoutKey);
}

sub SavePlayerLockout {
    return if (GetPlayerLockout());

    my $pcLockoutKey = "$LOCKOUT_KEY-$charid";
    my $created = GetInstanceCreated();
    my $lockoutTime = $INSTANCE_LOCKOUT < $INSTANCE_LIFETIME ? $INSTANCE_LIFETIME : $INSTANCE_LOCKOUT;

    quest::set_data($pcLockoutKey, $created + $lockoutTime, $created + $lockoutTime - time);
}

sub IsLockedOut {
    my $pcLockoutKey = "$LOCKOUT_KEY-$charid";
    my $val = quest::get_data($pcLockoutKey);
    return $val && $val > time();
}

# Returns 1 if the PC is in the same instance as their raid or group leader, 0 otherwise.
sub InSameInstanceAsLeader {
    my $instid = GetCurrentInstanceID();
    return 0 unless ($instid);

    my $raid  = shift || $client->GetRaid();
    my $group = shift || $client->GetGroup();

    # Raid/group leader automatically passes
    return 1 if (!$raid && !$group);
    return 1 if ($raid && $raid->IsLeader($name));
    return 1 if (!$raid && $group && $group->IsLeader($client));

    my $leaderID = ($raid == undef) ? GetGroupLeaderCharacterID($group) : GetRaidLeaderCharacterID($raid);
    return 0 unless ($leaderID);

    my $leader_instance = quest::GetInstanceIDByCharID($INSTANCE_ZONE, $INSTANCE_VERSION, $leaderID);
    return 0 unless ($leader_instance);

    return $instid == $leader_instance;
}

# Look up the character ID for the current GROUP leader via the database so
# it works across zones.
sub GetGroupLeaderCharacterID {
    my $group = shift || $client->GetGroup();
    return 0 unless ($group);
    my $leaderName = $group->GetLeaderName();
    return 0 unless ($leaderName);

    my $db = plugin::LoadMysql();
    my $query = sprintf("SELECT `id` FROM `character_data` WHERE `name` = '%s';", $leaderName =~ s/'/\\\\'/r);
    my $stmt = $db->prepare($query);
    $stmt->execute();
    my @row = $stmt->fetchrow_array();
    return $row[0] if (@row);
    return undef;
}

# Look up the character ID for the current RAID leader via the database so
# it works across zones.
sub GetRaidLeaderCharacterID {
    my $raid = shift || $client->GetRaid();
    return 0 unless ($raid);
    my $raidid = $raid->GetID();
    return 0 unless ($raidid);

    my $db = plugin::LoadMysql();
    my $query = sprintf("SELECT `charid` FROM `raid_members` WHERE `raidid` = %d AND israidleader=1;", $raidid);
    my $stmt = $db->prepare($query);
    $stmt->execute();
    my @row = $stmt->fetchrow_array();
    return $row[0] if (@row);
    return undef;
}

