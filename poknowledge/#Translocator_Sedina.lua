function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("Hello there. I'm afraid this portal stone is malfunctioning. The Academy of Arcane Sciences is working on the problem. If you need to travel to [Nektulos] forest in the meantime, I can transport you there.");
  elseif(e.message:findi("nektulos")) then
    eq.SelfCast(564);
  end
end
