#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;

main()
{
		
        maps\mp\_load::main();
        maps\mp\favela_escape_fx::main();
        maps\createfx\favela_escape_fx::main();
        maps\createart\favela_escape_art::main();

        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";

        maps\mp\_compass::setupMiniMap( "compass_map_favela_escape" );
		
		ambientPlay( "ambient_mp_rural" );
		
}