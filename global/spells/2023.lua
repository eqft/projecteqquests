-- Translocate: Great Divide
function event_spell_effect_translocate_complete(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  client:MovePC(118, 3652.6, -3766.6, -238, 254); -- Great Divide
  return 1;
end

