-- Succor: Ro
function event_spell_effect(e)
  local mob = e.target;
  if ( mob:IsClient() ) then
    local client = e.target:CastToClient();
    client:MovePC(35, 304, -2000, -25, 240); -- Zone: causeway
  end

  return 1;
end
