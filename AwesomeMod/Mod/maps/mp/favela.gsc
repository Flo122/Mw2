#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;

main()
{		
	maps\mp\_load::main();
              maps\createart\favela_art::main();
              maps\createfx\favela_fx::main();
              maps\mp\favela_fx::main();

	setdvar( "compassmaxrange", "1500" );

	game[ "attackers" ] = "allies";
	game[ "defenders" ] = "axis";

	maps\mp\_compass::setupMiniMap( "compass_map_favela" );
	setdvar( "compassmaxrange", "2000" );
	level.airstrikeHeightScale = 2;
		
	ambientPlay( "ambient_mp_favela" );
}