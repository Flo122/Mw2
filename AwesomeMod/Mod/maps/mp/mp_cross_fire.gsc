main()
{
	maps\mp\_load::main();
	
	maps\mp\mp_cross_fire_fx::main();
	maps\mp\mp_cross_fire_precache::main();
	
	maps\createfx\mp_cross_fire_fx::main();
	maps\createart\mp_cross_fire_art::main();
	
	maps\mp\_compass::setupMiniMap( "compass_map_mp_cross_fire" );

	VisionSetNaked( "mp_cross_fire" );
	
	//ambientPlay("ambient_mp_crash");
	//ambientPlay( "ambient_mp_rural" );
	//ambientPlay("ambient_dcemp_dry");
	ambientPlay("ambient_trainer_ext2");
	

	//game["allies"] = "marines";
	//game["axis"] = "opfor";
	game[ "attackers" ] = "axis";
	game[ "defenders" ] = "allies";
	//game["allies_soldiertype"] = "desert";
	//game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "4.5" );
	setdvar( "r_filmaltshader", "0" );

	setdvar( "compassmaxrange", "2100" );

}