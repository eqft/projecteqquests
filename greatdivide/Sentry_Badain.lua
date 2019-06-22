function event_say(e)
    if (e.message:findi("hail")) then
        e.self:Say("Greetings!");
    end
end

function event_trade(e)
    local item_lib = require("items");

    -- Declaration of War
    if (e.other:GetGM() and e.other:Admin() >= 50 and item_lib.check_turn_in(e.trade, {item1 = 1567})) then 
        local el = eq.get_entity_list();
        local master = el:GetMobByNpcTypeID(118173):CastToNPC();

        if (master) then
            e.self:Say("Hold on to your butts.....");
            master:Signal(1);
        end
    end

    item_lib.return_items(e.self, e.other, e.trade);
end

