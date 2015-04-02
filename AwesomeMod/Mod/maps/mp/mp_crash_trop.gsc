main()
{
	maps\mp\mp_crash_trop_fx::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap( "compass_map_mp_crash_dlc" );

	AmbientPlay( "ambient_mp_crash" );

	game["attackers"] = "axis";
	game["defenders"] = "allies";

	SetDvar( "r_specularcolorscale", "1" );
	SetDvar( "compassmaxrange", "1600" );

	setdvar( "r_lightGridEnableTweaks", 1 );
	setdvar( "r_lightGridIntensity", 1.20 );
	setdvar( "r_lightGridContrast", 1 );
}