#include common_scripts\utility;
 
main()
{
	maps\boneyard_fx::main();
 
        maps\mp\_load::main();
  
        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";

	// compass setup
        maps\mp\_compass::setupMiniMap( "compass_map_boneyard" );
        setdvar( "compassmaxrange", "4000" );
}