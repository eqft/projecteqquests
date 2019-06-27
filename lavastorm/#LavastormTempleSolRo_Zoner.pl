# #LavastormTempleSolRo_Zoner.pl
sub EVENT_SPAWN
{
	$npc->TempName("");
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
}

sub EVENT_ENTER
{
	quest::movepc(80,20.21,259.45,3,454);
}
#END of FILE Lavastorm:TempleSolRo teleporter
