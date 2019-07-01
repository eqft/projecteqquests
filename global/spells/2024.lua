-- Translocate: Wakening
function event_spell_effect_translocate_complete(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  client:MovePC(119, -3033, -3040, 28, 91); -- Wakening Lands
  return 1;
end

