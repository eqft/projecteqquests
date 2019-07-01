-- Translocate: Iceclad
function event_spell_effect_translocate_complete(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  client:MovePC(110, 4925, -630, 113, 423); -- Iceclad
  return 1;
end

