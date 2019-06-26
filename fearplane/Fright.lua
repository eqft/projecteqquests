function event_signal(e)
	entity_list = eq.get_entity_list();

	if(e.signal == 1) then
        eq.set_timer("shout", math.random(1000));
	elseif(e.signal == 2) then
		local mobtypeID =  entity_list:GetMobByNpcTypeID(72003);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob);
	elseif(e.signal == 3) then
		eq.stop_follow();
	end
end

function event_timer(e)
    if (e.timer == "shout") then
        eq.stop_timer("shout");
        e.self:Shout("Such is the will of Cazic-Thule!");
    end
end

--Spawns an iksar broodling on the death of the golems 75% of the time.
function event_death_complete(e)
	local a = eq.ChooseRandom(72105,72105,72105,0);
	eq.spawn2(a,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end
