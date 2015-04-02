#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

main()
{

 
        maps\mp\_load::main();
		maps\mp\co_hunted_fx::main();
		maps\createart\co_hunted_art::main();
		maps\mp\hunted_precache::main();
 
        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";
		
		ambientPlay( "ambient_mp_rural" );
 
        maps\mp\_compass::setupMiniMap( "compass_map_hunted" );
        setdvar( "compassmaxrange", "3000" );
}