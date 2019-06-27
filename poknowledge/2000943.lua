
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("'Greetings, traveler.  I am a master jeweler in search of the rarest and most expensive gems to work with.  If you have any Diamonds, Blue Diamonds, Black Sapphires, or Ruby Crowns, just hand them to me and I will pay you 1 Outfitter Coin each. Then just browse my stock of finished jewelry and make your choices.  I guarantee the finest quality.'");
    end
end

function event_trade(e)
    local item_lib = require("items");
    local totalCoins = 0;

    for i = 1, 4 do
        local item = e.trade["item" .. i];

        if(item.valid and item) then
            local itemid = item:GetID();

            if (itemid == 22503 or itemid == 10037 or itemid == 10036 or itemid == 10051) then
                -- Items we buy
                local itemcount = 1;

                if (item:IsStackable()) then 
                    itemcount = item:GetCharges();
                end

                totalCoins = totalCoins + itemcount;
                e.trade["item" .. i] = nil;
            elseif (itemid == 99993) then
                -- Outfitter Coin
                e.other:Message(14, "To use Outfitter Coins, first Reclaim them on the Alt. Currency tab of your Inventory.");
            end
        end
    end

    if (totalCoins > 0) then
        e.self:Say("That comes to a total of " .. totalCoins .. " coins.  Thank you for your business.");
        e.other:SummonItem(99993, totalCoins);
    end

    item_lib.return_items(e.self, e.other, e.trade);
end
