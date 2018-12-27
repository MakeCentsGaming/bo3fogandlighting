#using scripts\shared\clientfield_shared;
#using scripts\shared\system_shared;
#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;
#using scripts\shared\flag_shared;

/*
#####################
by: M.A.K.E C E N T S
#####################
mapname.gsc:
#using scripts\zm\Fog\fog_change;

zone:
scriptparsetree,scripts/zm/Fog/fog_change.gsc
###############################################################################
*/

REGISTER_SYSTEM( "my_fog", &__init__, undefined )

function __init__()
{
	clientfield::register( "world", "fog_change", VERSION_SHIP, 1, "int" );
}

function autoexec init()
{	
	level thread TestingFog();
}

function private TestingFog()
{
	level flag::wait_till("initial_blackscreen_passed");
	level clientfield::set( "fog_change", 1 );
	while(1)
	{
		wait(10);
		IPrintLnBold("set fog to 0");
		level clientfield::set( "fog_change", 0 );
		SetFogForAllPlayers(0);
		SetLightingState(0);
		wait(10);
		IPrintLnBold("set fog to 1");
		level clientfield::set( "fog_change", 1 );
		SetFogForAllPlayers(1);
		SetLightingState(1);

	}
}

function private SetFogForAllPlayers(state)
{
	players = GetPlayers();
	foreach(player in players)
	{
		player SetWorldFogActiveBank(state);
	}
}