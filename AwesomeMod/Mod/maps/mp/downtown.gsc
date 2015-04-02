#include common_scripts\utility;
 
main()
{
	maps\createfx\favela_fx::main();
 
        maps\mp\_load::main();
  
        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";

	// compass setup
        maps\mp\_compass::setupMiniMap( "compass_map_favela" );
        setdvar( "compassmaxrange", "4000" );
}

start()
{
wait 20;
self thread maps\mp\gametypes\_hud_message::hintMessage("^5Downtown ^1 by ^3TheProphetHD");

}