sub EVENT_SPELL_EFFECT_CLIENT
{
    $client->Message(303,"[GM] YOU ARE IN TIME OUT.  WAIT FOR A GM.");
    quest::movepc(45,0,0,-10,0);
}
