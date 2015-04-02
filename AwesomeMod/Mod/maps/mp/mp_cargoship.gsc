#include common_scripts\utility;
 
main()
{

 
        maps\mp\_load::main();
 
	setExpFog(300, 1400, 0.5, 0.5, 0.5, 0);
	maps\mp\mp_cargoship_fx::main();
 
        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";
 
        maps\mp\_compass::setupMiniMap( "compass_map_mp_cargoship" );
//        setdvar( "compassmaxrange", "4000" );
 
	setdvar( "r_specularcolorscale", "1" );

	setdvar("compassmaxrange","2100");

	thread rotate_radar();
}


rotate_radar()
{

	radar = getent("radar","targetname");

	time = 10000;


	while(1)

	{

		radar rotateVelocity((0,120,0), time);
		
wait time;

	}

}