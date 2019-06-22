##Skills Vendor
##Created by Durge

sub EVENT_SAY
{
	$skills = quest::saylink("skills");
	
	if($text=~/hail/i)
	{
		$client->Message(315,"$NPCNAME whispers to you, 'Hello there $name, are you here to purchase [$skills]?'");
	}
	
	if($text=~/skills/i)
	{
		$client->Message(315,"$NPCNAME whispers to you, 'Yes, for a price I can set your skills. For 1000 platinum all your class skills will be set to 100, for 2000 platinum your class skills will be set to 200, and for 3000 platinum your class skills will be set to 300, and for 4500 platinum ALL your skills will be set to 400.'");
	}
}

sub EVENT_ITEM
{
	if($platinum == 1000)
	{
		if($class eq 'Shadowknight')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 100);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 100);
			}
			if($ulevel >= 17)
			{
				quest::setskill(34, 100);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 100);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 100);
			}
			if($ulevel >= 40)
			{
				quest::setskill(16, 100);
			}
		}
		
		if($class eq 'Warrior')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 100);
				quest::setskill(19, 100);
			}
			if($ulevel >= 10)
			{
				quest::setskill(34, 100);
			}
			if($ulevel >= 13)
			{
				quest::setskill(22, 100);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 100);
			}
			if($ulevel >= 25)
			{
				quest::setskill(37, 100);
			}
			if($ulevel >= 35)
			{
				quest::setskill(16, 100);
			}
		}
		
		if($class eq 'Necromancer' || $class eq 'Enchanter' || $class eq 'Magician' || $class eq 'Wizard')
		{
			if($ulevel >= 16)
			{
				quest::setskill(58, 100);
			}
			if($ulevel >= 20)
			{
				quest::setskill(43, 100);
				quest::setskill(44, 100);
				quest::setskill(45, 100);
				quest::setskill(46, 100);
				quest::setskill(47, 100);
				$client->Message(315, "$NPCNAME whispers to you, 'Remember you can only have 1 specialization.'");
			}
			if($ulevel >= 22)
			{
				quest::setskill(19, 100);
			}
			
		}
		
		if($class eq 'Cleric')
		{
			if($ulevel >= 25)
			{
				quest::setskill(10, 100);
			}
			
		}
		
		if($class eq 'Shaman')
		{
			if($ulevel >= 25)
			{
				quest::setskill(59, 100);
			}
			
		}
		
		if($class eq 'Druid')
		{
			if($ulevel >= 5)
			{
				quest::setskill(27, 100);
			}
			if($ulevel >= 20)
			{
				quest::setskill(53, 100);
			}
			
		}
		
		if($class eq 'Druid' || $class eq 'Shaman' || $class eq 'Cleric')
		{
			if($ulevel >=15)
			{
				quest::setskill(19, 100);
			}
			if($ulevel >= 30)
			{
				quest::setskill(43, 100);
				quest::setskill(44, 100);
				quest::setskill(45, 100);
				quest::setskill(46, 100);
				quest::setskill(47, 100);
				$client->Message(315, "$NPCNAME whispers to you, 'Remember you can only have 1 specialization.'");
			}
			
		}
		
		if($class eq 'Rogue')
		{
			if($ulevel >= 4)
			{
				quest::setskill(19, 100);
			}
			if($ulevel >= 5)
			{
				quest::setskill(35, 100);
			}
			if($ulevel >= 7)
			{
				quest::setskill(48, 100);
			}
			if($ulevel >= 10)
			{
				quest::setskill(62, 100);
				quest::setskill(8, 100);
			}
			if($ulevel >= 12)
			{
				quest::setskill(34, 100);
				quest::setskill(39, 100);
			}
			if($ulevel >= 13)
			{
				quest::setskill(22, 100);
			}
			if($ulevel >= 15)
			{
				quest::setskill(17, 100);
			}
			if($ulevel >= 16)
			{
				quest::setskill(20, 100);
			}
			if($ulevel >= 18)
			{
				quest::setskill(6, 100);
			}
			if($ulevel >= 20)
			{
				quest::setskill(56, 100);
			}
			if($ulevel >= 22)
			{
				quest::setskill(71, 100);
			}
			if($ulevel >= 27)
			{
				quest::setskill(16, 100);
			}
			
		}
		
		if($class eq 'Ranger')
		{
			if($ulevel >= 5)
			{
				quest::setskill(30, 100);
			}
			if($ulevel >= 8)
			{
				quest::setskill(19, 100);
			}
			if($ulevel >= 10)
			{
				quest::setskill(42, 100);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 100);
			}
			if($ulevel >= 18)
			{
				quest::setskill(34, 100);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 100);
			}
			if($ulevel >= 35)
			{
				quest::setskill(17, 100);
				quest::setskill(37, 100);
			}
			
		}
		
		if($class eq 'Monk')
		{
			if($ulevel >= 3)
			{
				quest::setskill(39, 100);
			}
			if($ulevel >= 5)
			{
				quest::setskill(38, 100);
			}
			if($ulevel >= 10)
			{
				quest::setskill(52, 100);
			}
			if($ulevel >= 12)
			{
				quest::setskill(11, 100);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 100);
			}
			if($ulevel >= 17)
			{
				quest::setskill(28, 100);
			}
			if($ulevel >= 18)
			{
				quest::setskill(71, 100);
			}
			if($ulevel >= 20)
			{
				quest::setskill(23, 100);
			}
			if($ulevel >= 25)
			{
				quest::setskill(21, 100);
			}
			if($ulevel >= 27)
			{
				quest::setskill(17, 100);
			}
			if($ulevel >= 30)
			{
				quest::setskill(26, 100);
			}
			if($ulevel >= 35)
			{
				quest::setskill(37, 100);
			}
			
		}
		
		if($class eq 'Bard')
		{
			if($ulevel >= 5)
			{
				quest::setskill(70, 100);
			}
			if($ulevel >= 8)
			{
				quest::setskill(49, 100);
			}
			if($ulevel >= 10)
			{
				quest::setskill(31, 100);
				quest::setskill(35, 100);
			}
			if($ulevel >= 11)
			{
				quest::setskill(12, 100);
			}
			if($ulevel >= 12)
			{
				quest::setskill(27, 100);
			}
			if($ulevel >= 14)
			{
				quest::setskill(54, 100);
			}
			if($ulevel >= 15)
			{
				quest::setskill(62, 100);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 100);
				quest::setskill(42, 100);
			}
			if($ulevel >= 20)
			{
				quest::setskill(17, 100);
			}
			if($ulevel >= 24)
			{
				quest::setskill(39, 100);
			}
			if($ulevel >= 25)
			{
				quest::setskill(29, 100);
			}
			if($ulevel >= 26)
			{
				quest::setskill(71, 100);
			}
			if($ulevel >= 35)
			{
				quest::setskill(53, 100);
			}
			if($ulevel >= 53)
			{
				quest::setskill(34, 100);
			}
			if($ulevel >= 58)
			{
				quest::setskill(37, 100);
			}
			
		}
		
		if($class eq 'Paladin')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 100);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 100);
			}
			if($ulevel >= 17)
			{
				quest::setskill(34, 100);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 100);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 100);
			}
			if($ulevel >= 40)
			{
				quest::setskill(16, 100);
			}
			
		}
		
		if($class eq 'Beastlord')
		{
			if($ulevel >= 5)
			{
				quest::setskill(30, 100);
			}	
			if($ulevel >= 10)
			{
				quest::setskill(19, 100);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 100);
			}
			if($ulevel >= 25)
			{
				quest::setskill(11, 100);
			}
			if($ulevel >= 40)
			{
				quest::setskill(37, 100);
			}
			
		}
		
		if($class eq 'Berserker')
		{
			if($ulevel >= 6)
			{
				quest::setskill(74, 100);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 100);
			}
			if($ulevel >= 12)
			{
				quest::setskill(34, 100);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 100);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 100);
			}
			if($ulevel >= 35)
			{
				quest::setskill(16, 100);
			}
			
		}
	}
	elsif($platinum == 2000)
	{
		if($class eq 'Shadowknight')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 200);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 200);
			}
			if($ulevel >= 17)
			{
				quest::setskill(34, 200);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 200);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 200);
			}
			if($ulevel >= 40)
			{
				quest::setskill(16, 200);
			}
		}
		
		if($class eq 'Warrior')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 200);
				quest::setskill(19, 200);
			}
			if($ulevel >= 10)
			{
				quest::setskill(34, 200);
			}
			if($ulevel >= 13)
			{
				quest::setskill(22, 200);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 200);
			}
			if($ulevel >= 25)
			{
				quest::setskill(37, 200);
			}
			if($ulevel >= 35)
			{
				quest::setskill(16, 200);
			}
		}
		
		if($class eq 'Necromancer' || $class eq 'Enchanter' || $class eq 'Magician' || $class eq 'Wizard')
		{
			if($ulevel >= 16)
			{
				quest::setskill(58, 200);
			}
			if($ulevel >= 20)
			{
				quest::setskill(43, 200);
				quest::setskill(44, 200);
				quest::setskill(45, 200);
				quest::setskill(46, 200);
				quest::setskill(47, 200);
				$client->Message(315, "$NPCNAME whispers to you, 'Remember you can only have 1 specialization.'");
			}
			if($ulevel >= 22)
			{
				quest::setskill(19, 200);
			}
			
		}
		
		if($class eq 'Cleric')
		{
			if($ulevel >= 25)
			{
				quest::setskill(10, 200);
			}
			
		}
		
		if($class eq 'Shaman')
		{
			if($ulevel >= 25)
			{
				quest::setskill(59, 200);
			}
			
		}
		
		if($class eq 'Druid')
		{
			if($ulevel >= 5)
			{
				quest::setskill(27, 200);
			}
			if($ulevel >= 20)
			{
				quest::setskill(53, 200);
			}
			
		}
		
		if($class eq 'Druid' || $class eq 'Shaman' || $class eq 'Cleric')
		{
			if($ulevel >=15)
			{
				quest::setskill(19, 200);
			}
			if($ulevel >= 30)
			{
				quest::setskill(43, 200);
				quest::setskill(44, 200);
				quest::setskill(45, 200);
				quest::setskill(46, 200);
				quest::setskill(47, 200);
				$client->Message(315, "$NPCNAME whispers to you, 'Remember you can only have 1 specialization.'");
			}
			
		}
		
		if($class eq 'Rogue')
		{
			if($ulevel >= 4)
			{
				quest::setskill(19, 200);
			}
			if($ulevel >= 5)
			{
				quest::setskill(35, 200);
			}
			if($ulevel >= 7)
			{
				quest::setskill(48, 200);
			}
			if($ulevel >= 10)
			{
				quest::setskill(62, 200);
				quest::setskill(8, 200);
			}
			if($ulevel >= 12)
			{
				quest::setskill(34, 200);
				quest::setskill(39, 200);
			}
			if($ulevel >= 13)
			{
				quest::setskill(22, 200);
			}
			if($ulevel >= 15)
			{
				quest::setskill(17, 200);
			}
			if($ulevel >= 16)
			{
				quest::setskill(20, 200);
			}
			if($ulevel >= 18)
			{
				quest::setskill(6, 200);
			}
			if($ulevel >= 20)
			{
				quest::setskill(56, 200);
			}
			if($ulevel >= 22)
			{
				quest::setskill(71, 200);
			}
			if($ulevel >= 27)
			{
				quest::setskill(16, 200);
			}
			
		}
		
		if($class eq 'Ranger')
		{
			if($ulevel >= 5)
			{
				quest::setskill(30, 200);
			}
			if($ulevel >= 8)
			{
				quest::setskill(19, 200);
			}
			if($ulevel >= 10)
			{
				quest::setskill(42, 200);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 200);
			}
			if($ulevel >= 18)
			{
				quest::setskill(34, 200);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 200);
			}
			if($ulevel >= 35)
			{
				quest::setskill(17, 200);
				quest::setskill(37, 200);
			}
			
		}
		
		if($class eq 'Monk')
		{
			if($ulevel >= 3)
			{
				quest::setskill(39, 200);
			}
			if($ulevel >= 5)
			{
				quest::setskill(38, 200);
			}
			if($ulevel >= 10)
			{
				quest::setskill(52, 200);
			}
			if($ulevel >= 12)
			{
				quest::setskill(11, 200);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 200);
			}
			if($ulevel >= 17)
			{
				quest::setskill(28, 200);
			}
			if($ulevel >= 18)
			{
				quest::setskill(71, 200);
			}
			if($ulevel >= 20)
			{
				quest::setskill(23, 200);
			}
			if($ulevel >= 25)
			{
				quest::setskill(21, 200);
			}
			if($ulevel >= 27)
			{
				quest::setskill(17, 200);
			}
			if($ulevel >= 30)
			{
				quest::setskill(26, 200);
			}
			if($ulevel >= 35)
			{
				quest::setskill(37, 200);
			}
			
		}
		
		if($class eq 'Bard')
		{
			if($ulevel >= 5)
			{
				quest::setskill(70, 200);
			}
			if($ulevel >= 8)
			{
				quest::setskill(49, 200);
			}
			if($ulevel >= 10)
			{
				quest::setskill(31, 200);
				quest::setskill(35, 200);
			}
			if($ulevel >= 11)
			{
				quest::setskill(12, 200);
			}
			if($ulevel >= 12)
			{
				quest::setskill(27, 200);
			}
			if($ulevel >= 14)
			{
				quest::setskill(54, 200);
			}
			if($ulevel >= 15)
			{
				quest::setskill(62, 200);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 200);
				quest::setskill(42, 200);
			}
			if($ulevel >= 20)
			{
				quest::setskill(17, 200);
			}
			if($ulevel >= 24)
			{
				quest::setskill(39, 200);
			}
			if($ulevel >= 25)
			{
				quest::setskill(29, 200);
			}
			if($ulevel >= 26)
			{
				quest::setskill(71, 200);
			}
			if($ulevel >= 35)
			{
				quest::setskill(53, 200);
			}
			if($ulevel >= 53)
			{
				quest::setskill(34, 200);
			}
			if($ulevel >= 58)
			{
				quest::setskill(37, 200);
			}
			
		}
		
		if($class eq 'Paladin')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 200);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 200);
			}
			if($ulevel >= 17)
			{
				quest::setskill(34, 200);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 200);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 200);
			}
			if($ulevel >= 40)
			{
				quest::setskill(16, 200);
			}
			
		}
		
		if($class eq 'Beastlord')
		{
			if($ulevel >= 5)
			{
				quest::setskill(30, 200);
			}	
			if($ulevel >= 10)
			{
				quest::setskill(19, 200);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 200);
			}
			if($ulevel >= 25)
			{
				quest::setskill(11, 200);
			}
			if($ulevel >= 40)
			{
				quest::setskill(37, 200);
			}
			
		}
		
		if($class eq 'Berserker')
		{
			if($ulevel >= 6)
			{
				quest::setskill(74, 200);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 200);
			}
			if($ulevel >= 12)
			{
				quest::setskill(34, 200);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 200);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 200);
			}
			if($ulevel >= 35)
			{
				quest::setskill(16, 200);
			}
			
		}
	}
	elsif($platinum == 3000)
	{
		if($class eq 'Shadowknight')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 300);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 300);
			}
			if($ulevel >= 17)
			{
				quest::setskill(34, 300);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 300);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 300);
			}
			if($ulevel >= 40)
			{
				quest::setskill(16, 300);
			}
		}
		
		if($class eq 'Warrior')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 300);
				quest::setskill(19, 300);
			}
			if($ulevel >= 10)
			{
				quest::setskill(34, 300);
			}
			if($ulevel >= 13)
			{
				quest::setskill(22, 300);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 300);
			}
			if($ulevel >= 25)
			{
				quest::setskill(37, 300);
			}
			if($ulevel >= 35)
			{
				quest::setskill(16, 300);
			}
		}
		
		if($class eq 'Necromancer' || $class eq 'Enchanter' || $class eq 'Magician' || $class eq 'Wizard')
		{
			if($ulevel >= 16)
			{
				quest::setskill(58, 300);
			}
			if($ulevel >= 20)
			{
				quest::setskill(43, 300);
				quest::setskill(44, 300);
				quest::setskill(45, 300);
				quest::setskill(46, 300);
				quest::setskill(47, 300);
				$client->Message(315, "$NPCNAME whispers to you, 'Remember you can only have 1 specialization.'");
			}
			if($ulevel >= 22)
			{
				quest::setskill(19, 300);
			}
			
		}
		
		if($class eq 'Cleric')
		{
			if($ulevel >= 25)
			{
				quest::setskill(10, 300);
			}
			
		}
		
		if($class eq 'Shaman')
		{
			if($ulevel >= 25)
			{
				quest::setskill(59, 300);
			}
			
		}
		
		if($class eq 'Druid')
		{
			if($ulevel >= 5)
			{
				quest::setskill(27, 300);
			}
			if($ulevel >= 20)
			{
				quest::setskill(53, 300);
			}
			
		}
		
		if($class eq 'Druid' || $class eq 'Shaman' || $class eq 'Cleric')
		{
			if($ulevel >=15)
			{
				quest::setskill(19, 300);
			}
			if($ulevel >= 30)
			{
				quest::setskill(43, 300);
				quest::setskill(44, 300);
				quest::setskill(45, 300);
				quest::setskill(46, 300);
				quest::setskill(47, 300);
				$client->Message(315, "$NPCNAME whispers to you, 'Remember you can only have 1 specialization.'");
			}
			
		}
		
		if($class eq 'Rogue')
		{
			if($ulevel >= 4)
			{
				quest::setskill(19, 300);
			}
			if($ulevel >= 5)
			{
				quest::setskill(35, 300);
			}
			if($ulevel >= 7)
			{
				quest::setskill(48, 300);
			}
			if($ulevel >= 10)
			{
				quest::setskill(62, 300);
				quest::setskill(8, 300);
			}
			if($ulevel >= 12)
			{
				quest::setskill(34, 300);
				quest::setskill(39, 300);
			}
			if($ulevel >= 13)
			{
				quest::setskill(22, 300);
			}
			if($ulevel >= 15)
			{
				quest::setskill(17, 300);
			}
			if($ulevel >= 16)
			{
				quest::setskill(20, 300);
			}
			if($ulevel >= 18)
			{
				quest::setskill(6, 300);
			}
			if($ulevel >= 20)
			{
				quest::setskill(56, 300);
			}
			if($ulevel >= 22)
			{
				quest::setskill(71, 300);
			}
			if($ulevel >= 27)
			{
				quest::setskill(16, 300);
			}
			
		}
		
		if($class eq 'Ranger')
		{
			if($ulevel >= 5)
			{
				quest::setskill(30, 300);
			}
			if($ulevel >= 8)
			{
				quest::setskill(19, 300);
			}
			if($ulevel >= 10)
			{
				quest::setskill(42, 300);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 300);
			}
			if($ulevel >= 18)
			{
				quest::setskill(34, 300);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 300);
			}
			if($ulevel >= 35)
			{
				quest::setskill(17, 300);
				quest::setskill(37, 300);
			}
			
		}
		
		if($class eq 'Monk')
		{
			if($ulevel >= 3)
			{
				quest::setskill(39, 300);
			}
			if($ulevel >= 5)
			{
				quest::setskill(38, 300);
			}
			if($ulevel >= 10)
			{
				quest::setskill(52, 300);
			}
			if($ulevel >= 12)
			{
				quest::setskill(11, 300);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 300);
			}
			if($ulevel >= 17)
			{
				quest::setskill(28, 300);
			}
			if($ulevel >= 18)
			{
				quest::setskill(71, 300);
			}
			if($ulevel >= 20)
			{
				quest::setskill(23, 300);
			}
			if($ulevel >= 25)
			{
				quest::setskill(21, 300);
			}
			if($ulevel >= 27)
			{
				quest::setskill(17, 300);
			}
			if($ulevel >= 30)
			{
				quest::setskill(26, 300);
			}
			if($ulevel >= 35)
			{
				quest::setskill(37, 300);
			}
			
		}
		
		if($class eq 'Bard')
		{
			if($ulevel >= 5)
			{
				quest::setskill(70, 300);
			}
			if($ulevel >= 8)
			{
				quest::setskill(49, 300);
			}
			if($ulevel >= 10)
			{
				quest::setskill(31, 300);
				quest::setskill(35, 300);
			}
			if($ulevel >= 11)
			{
				quest::setskill(12, 300);
			}
			if($ulevel >= 12)
			{
				quest::setskill(27, 300);
			}
			if($ulevel >= 14)
			{
				quest::setskill(54, 300);
			}
			if($ulevel >= 15)
			{
				quest::setskill(62, 300);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 300);
				quest::setskill(42, 300);
			}
			if($ulevel >= 20)
			{
				quest::setskill(17, 300);
			}
			if($ulevel >= 24)
			{
				quest::setskill(39, 300);
			}
			if($ulevel >= 25)
			{
				quest::setskill(29, 300);
			}
			if($ulevel >= 26)
			{
				quest::setskill(71, 300);
			}
			if($ulevel >= 35)
			{
				quest::setskill(53, 300);
			}
			if($ulevel >= 53)
			{
				quest::setskill(34, 300);
			}
			if($ulevel >= 58)
			{
				quest::setskill(37, 300);
			}
			
		}
		
		if($class eq 'Paladin')
		{
			if($ulevel >= 6)
			{
				quest::setskill(10, 300);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 300);
			}
			if($ulevel >= 17)
			{
				quest::setskill(34, 300);
			}
			if($ulevel >= 20)
			{
				quest::setskill(20, 300);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 300);
			}
			if($ulevel >= 40)
			{
				quest::setskill(16, 300);
			}
			
		}
		
		if($class eq 'Beastlord')
		{
			if($ulevel >= 5)
			{
				quest::setskill(30, 300);
			}	
			if($ulevel >= 10)
			{
				quest::setskill(19, 300);
			}
			if($ulevel >= 17)
			{
				quest::setskill(22, 300);
			}
			if($ulevel >= 25)
			{
				quest::setskill(11, 300);
			}
			if($ulevel >= 40)
			{
				quest::setskill(37, 300);
			}
			
		}
		
		if($class eq 'Berserker')
		{
			if($ulevel >= 6)
			{
				quest::setskill(74, 300);
			}
			if($ulevel >= 10)
			{
				quest::setskill(19, 300);
			}
			if($ulevel >= 12)
			{
				quest::setskill(34, 300);
			}
			if($ulevel >= 15)
			{
				quest::setskill(20, 300);
			}
			if($ulevel >= 30)
			{
				quest::setskill(37, 300);
			}
			if($ulevel >= 35)
			{
				quest::setskill(16, 300);
			}
			
		}
	}
	elsif($platinum == 4500)
	{
		quest::setallskill(400);
	}
	else
	{
		$client->Message(315, "$NPCNAME whispers to you, 'This is not what I want.'");
		plugin::return_items(\%itemcount);
	}
}
