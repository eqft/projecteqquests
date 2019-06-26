sub EVENT_ITEM {
    if (defined($itemcount{99993}) && $itemcount{99993} > 0) {
        $client->Message(14, "To use Outfitter Coins, first Reclaim them on the Alt. Currency tab of your Inventory.");
    }
    plugin::return_items(\%itemcount);
}
