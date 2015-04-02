main()
{
	maps\mp\_load::main();
	
	maps\mp\_compass::setupMiniMap("compass_map_mp_bog_sh");

	ambientPlay("ambient_middleeast_ext");


	game["attackers"] = "axis";
	game["defenders"] = "allies";

	setdvar( "r_specularcolorscale", "1" );

	setdvar("compassmaxrange","2000");
	
	// raise up planes to avoid them flying through buildings
	level.airstrikeHeightScale = 1.8;
}