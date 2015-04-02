/************************************/
/*         Map by momo5502          */
/************************************/


#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

 
main()
{		
        maps\mp\_load::main();
		maps\mp\estate_fx::main();
		maps\createart\estate_art::main();
		maps\createart\estate_fog::main();
		common_scripts\_destructible_types_anim_airconditioner::main();
		common_scripts\_destructible_types_anim_generator::main();
		common_scripts\_destructible_types_anim_me_fanceil1_spin::main();
 
        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";
		
		ambientPlay( "ambient_mp_estate" );
		
        maps\mp\_compass::setupMiniMap( "compass_map_estate" );
        setdvar( "compassmaxrange", "4000" );
		
		VisionSetNaked( "estate", 0 );
}