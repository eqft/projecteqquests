-- Translocate: Cobalt Scar
function event_spell_effect_translocate_complete(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  client:MovePC(117, -1634, -1065, 298, 113); -- Cobalt Scar
  return 1;
end

