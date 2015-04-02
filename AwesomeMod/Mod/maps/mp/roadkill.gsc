#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;

main()
{
        maps\createart\roadkill_art::main();
        maps\createfx\roadkill_fx::main();
        maps\mp\roadkill_fx::main();
        maps\mp\_load::main();

        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";

        maps\mp\_compass::setupMiniMap( "compass_map_roadkill" );
        ambientPlay( "ambient_mp_invasion" );
		
}