main()
{
	thread precache_createfx_fx();
	maps\createfx\mp_cargoship_fx::main();
}

precache_createfx_fx()
{

	level._effect["rain_heavy_mist"]					= loadfx ("weather/rain_mp_cargoship");	
	level._effect["lightning"]							= loadfx ("weather/lightning");
	level._effect["mp_cargoship_rain_noise01"]			= loadfx ("ambient_runners/mp_cargoship_rain_noise01");
	level._effect["mp_cargoship_rain_noise02"]			= loadfx ("ambient_runners/mp_cargoship_rain_noise02");
	level._effect["mp_cargoship_rain_noise03"]			= loadfx ("ambient_runners/mp_cargoship_rain_noise03");
	level._effect["mp_cargoship_rain_noise04"]			= loadfx ("ambient_runners/mp_cargoship_rain_noise04");
	level._effect["mp_cargoship_rain_noise05"]			= loadfx ("ambient_runners/mp_cargoship_rain_noise05");
	level._effect["mp_cargoship_rain_noise_ud01"]		= loadfx ("ambient_runners/mp_cargoship_rain_noise_ud01");
	level._effect["mp_cargoship_rain_noise_ud02"]		= loadfx ("ambient_runners/mp_cargoship_rain_noise_ud02");
	level._effect["mp_cargoship_rain_noise_ud03"]		= loadfx ("ambient_runners/mp_cargoship_rain_noise_ud03");
	level._effect["cgoshp_drips_a"]						= loadfx ("misc/cgoshp_drips_a");
	level._effect["cgoshp_drips"]						= loadfx ("misc/cgoshp_drips");
	
}
