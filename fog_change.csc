#using scripts\shared\clientfield_shared;
#using scripts\shared\system_shared;
#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

/*
#####################
by: M.A.K.E C E N T S
#####################
Script:

Add to top of mapname.csc
#using scripts\zm\fog\fog_change;

Add to zone file
scriptparsetree,scripts/zm/fog/fog_change.csc

###############################################################################
*/

REGISTER_SYSTEM( "my_fog", &__init__, undefined )

function __init__()
{
	//this goes in the widows_wine_client_field_func() function
	clientfield::register( "world", "fog_change", VERSION_SHIP, 1, "int", &fogchange, !CF_HOST_ONLY, CF_CALLBACK_ZERO_ON_NEW_ENT );

}

function fogchange(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump )
{
	SetLitFogBank(localClientNum,-1,newVal,0);
}