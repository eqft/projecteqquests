# #LavastormTempleSolRo_Zoner.lua
function event_spawn(e) {
	e.self:TempName("");
	local x = e.self:GetX();
	local y = e.self:GetY();
	eq.set_proximity(x - 15, x + 15, y - 15, y + 15);
}

function event_enter(e) {
	e.other:MovePC(80, 20.21, 259.45, 3, 454);
}
#END of FILE Lavastorm:TempleSolRo teleporter
