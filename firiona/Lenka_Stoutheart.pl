sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("We're just kidding with you, kid. Heh. Although they are making heroes kinda small these days. Hey, you [want to see something interesting]?");
  } elsif ($text=~/something interesting/i) {
      $client->Message(0, "Lenka Stoutheart takes a jagged scimitar out of a wrap and lets you hold it. You feel as though it is linked to the spirit world. Lenka grabs it back. 'No, no! You can't keep it. But I can tell you there are plenty more weapons and armor like this. Just have to do a little dragon slaying.");
      $client->Message(0, "Bronto Thudfoot says 'No way, Lenka! This place is too dangerous for this kid. Why don't you just stay here and drink it up with us? The Samson couldn't even brew bog juice right, but every once in a while a bashed-up explorer comes in carrying [Cabby Pale Ale].");
  } elsif ($text=~/cabby pale ale/i) {
    # If he's not up, spawn Sir_Hobble (84297)
    quest::spawn_from_spawn2(14458) unless ($entity_list->IsMobSpawnedByNpcTypeID(84297));
    quest::say("It's the only decent thing to drink around here!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:firiona  ID:84122 -- Lenka_Stoutheart
