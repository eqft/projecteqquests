-- Retrieve Diamond from a GM Thank-You Note (item #99996)
function event_spell_effect(e) 
  e.target:Message(263, "You pull a Diamond off of a dab of wax securing it to the Thank-You Note.");
  return 0;
end


