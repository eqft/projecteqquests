sub EVENT_SAY { 
  if($text=~/Hail/i){
      quest::say("What's a kid like you doing in a dangerous place like this?  Shouldn't you be at home having bread. cakes and milk?"); 
  } elsif ($text=~/cabby pale ale/i) {
      quest::spawn_from_spawn2(14458) unless ($entity_list->IsMobSpawnedByNpcTypeID(84297));

      $client->Message(0, "Bronto Thudfoot takes a bottle from his pack and shows you. 'This is Cabby Pale Ale. CPA for short or, as they say in Lizardtown, Cabilis Pale Ale. I got it off a drunken dwarf. He said he bought it off a dark elf. Where he really got it, I am not sure.");
      $client->Message(0, "Lenka Stoutheart says 'I hear they sell the stuff in only two places. Lizardtown and Neriak. Hmmm. Now, why is that?");
  }
}
#END of FILE Zone:firiona  ID:84121 -- Bronto_Thudfoot 

