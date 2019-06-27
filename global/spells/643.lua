
-- 643 Call of Bones
-- Cancel effect if target is an NPC.  This prevents combat procs
-- on weapons from changing raid mobs into a skeleton.
function event_spell_effect(e) 
    if (e.target:IsNPC()) then
        e.target:ChangeSize(e.target:GetSize());
        return -1;
    end
    return 0;
end

