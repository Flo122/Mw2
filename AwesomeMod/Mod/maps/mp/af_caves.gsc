#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;

main()
{
		
        maps\mp\_load::main();

        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";

        maps\mp\_compass::setupMiniMap( "compass_map_afghan_caves" );
		
		ambientPlay( "ambient_mp_rural" );
		
}