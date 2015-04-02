main()
{
	maps\mp\mp_storm_spring_fx::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap( "compass_map_mp_storm_spring" );

	ambientPlay( "ambient_mp_storm" );

	game[ "attackers" ] = "axis";
	game[ "defenders" ] = "allies";

	setdvar( "r_lightGridEnableTweaks", 1 );
	setdvar( "r_lightGridIntensity", 1.20 );
	setdvar( "r_lightGridContrast", 1 );
}