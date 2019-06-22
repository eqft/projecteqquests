sub EVENT_SPELL_EFFECT_CLIENT
{
	$bindx = shift;
	$bindy = shift;
	$bindz = shift;
	$bindh = shift;
	$bindzone = shift;
	$bindx->{$charid} = $client->GetBindX();
	$bindy->{$charid} = $client->GetBindY();
	$bindz->{$charid} = $client->GetBindZ();
	$bindh->{$charid} = $client->GetBindHeading();
	$bindzone->{$charid} = $client->GetBindZoneID();
	
 	if($bindzone->{$charid} == 344)
 	{
		if(($client->GetClientVersionBit() & 4294967264)!= 0)
 		{
 			quest::MovePCInstance($bindzone->{$charid},5,$bindx->{$charid},$bindy->{$charid},$bindz->{$charid},$bindh->{$charid});
 		}
 		else
 		{
 			quest::movepc($bindzone->{$charid},$bindx->{$charid},$bindy->{$charid},$bindz->{$charid},$bindh->{$charid});
 		}
 	}
 	else
 	{
 		quest::movepc($bindzone->{$charid},$bindx->{$charid},$bindy->{$charid},$bindz->{$charid},$bindh->{$charid});
 	}
 }
