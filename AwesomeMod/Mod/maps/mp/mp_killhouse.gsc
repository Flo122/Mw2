main()
{
	maps\mp\mp_killhouse_fx::main();
	maps\createart\mp_killhouse_art::main();
	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap( "compass_map_mp_killhouse" );

	ambientPlay("ambient_mp_rural");

	game[ "attackers" ] = "allies";
	game[ "defenders" ] = "axis";

	setdvar("compassmaxrange","2200");
	setdvar( "r_specularcolorscale", "1" );
}

