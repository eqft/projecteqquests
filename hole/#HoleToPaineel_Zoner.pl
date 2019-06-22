# #HoleToPaineel_Zoner.pl
sub EVENT_SPAWN
{
	$npc->TempName("");
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
}

sub EVENT_ENTER
{
	quest::movepc(75,-904.96,748.30,-33.4,126.4);
}
#END of FILE Hole:Paineel Zoner (behind Master Yael) 
