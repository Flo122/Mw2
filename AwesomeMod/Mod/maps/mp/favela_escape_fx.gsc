#include common_scripts\utility;
#include maps\mp\_utility;

main()
{
	
	level._effect[ "technical_gate_shatter" ] = LoadFX( "explosions/wood_explosion_1" );
	
	level._effect[ "bird_takeoff_pm" ] = LoadFX( "misc/bird_takeoff_pm" );
	
	level._effect[ "headshot" ] = LoadFX( "impacts/flesh_hit_head_fatal_exit" );
	level._effect[ "bodyshot" ]	= LoadFX( "impacts/flesh_hit" );
	
	// ambient level fx
	level._effect[ "insects_carcass_runner" ] 	= LoadFX( "misc/insects_carcass_runner" );
	level._effect[ "firelp_med_pm" ] 			= LoadFX( "fire/firelp_med_pm" );
	level._effect[ "firelp_small_pm_a" ] 		= LoadFX( "fire/firelp_small_pm_a" );
	level._effect[ "dust_wind_fast" ] 			= LoadFX( "dust/dust_wind_fast" );
	level._effect[ "dust_wind_fast_light" ] 	= LoadFX( "dust/dust_wind_fast_light" );
	level._effect[ "trash_spiral_runner" ] 		= LoadFX( "misc/trash_spiral_runner" );
	level._effect[ "trash_spiral_runner_far" ] 	= LoadFX( "misc/trash_spiral_runner_far" );
	level._effect[ "leaves_fall_gentlewind" ] 	= LoadFX( "misc/leaves_fall_gentlewind" );
	level._effect[ "leaves_ground_gentlewind" ] = LoadFX( "misc/leaves_ground_gentlewind" );
	level._effect[ "hallway_smoke_light" ] 		= LoadFX( "smoke/hallway_smoke_light" );
	level._effect[ "battlefield_smokebank_S" ] 	= LoadFX( "smoke/battlefield_smokebank_S" );
	level._effect[ "room_smoke_200" ] 			= LoadFX( "smoke/room_smoke_200" );
	level._effect[ "room_smoke_200_fast_far" ] 	= LoadFX( "smoke/room_smoke_200_fast_far" );
	level._effect[ "insect_trail_runner_icbm" ] = LoadFX( "misc/insect_trail_runner_icbm" );
	level._effect[ "moth_runner" ] 				= LoadFX( "misc/moth_runner" );
	level._effect[ "insects_light_invasion" ] 	= LoadFX( "misc/insects_light_invasion" );
	level._effect[ "chimney_small" ] 			= LoadFX( "smoke/chimney_small" );
	level._effect[ "chimney_large" ] 			= LoadFX( "smoke/chimney_large" );
	level._effect[ "roof_slide" ] 				= LoadFX( "misc/roof_slide" );

	// airliner exhaust
	level._effect[ "airliner_exhaust" ]			= LoadFX( "fire/jet_engine_anatov_constant" );
	level._effect[ "airliner_wingtip_left" ]	= LoadFX( "misc/aircraft_light_wingtip_green" );
	level._effect[ "airliner_wingtip_right" ]	= LoadFX( "misc/aircraft_light_wingtip_red" );
	level._effect[ "airliner_tail" ]			= LoadFX( "misc/aircraft_light_white_blink" );
	level._effect[ "airliner_belly" ]			= LoadFX( "misc/aircraft_light_red_blink" );
	
	// fake chopper shellejects
	level._effect[ "hind_fake_shelleject" ] = LoadFX( "shellejects/20mm_cargoship" );
	
	// fake rotor wash dust
	level._effect[ "hind_fake_rotorwash_dust" ] = LoadFX( "treadfx/heli_dust_icbm" );
	
	// chopper flares
	level.flare_fx[ "pavelow" ] = LoadFX( "misc/flares_cobra" );
	
	// fake explosions for the chopper owning
	level._effect[ "hind_fake_explosion_1" ] = LoadFX( "explosions/grenadeexp_metal" );
	level._effect[ "hind_fake_explosion_2" ] = LoadFX( "explosions/circuit_breaker" );
	level._effect[ "hind_fake_explosion_3" ] = LoadFX( "explosions/pillar_explosion_brick_invasion" );
	
	// fx for player falling
	level._effect[ "playerfall_impact" ] = LoadFX( "impacts/bodyfall_dust_large" );
	level._effect[ "playerfall_residual" ] = LoadFX( "explosions/breach_room_residual" );
	
	// fake squibs around player
	level._effect[ "squib_plaster" ] = LoadFX( "impacts/large_plaster" );
	
	
	level._effect[ "flashlight" ] = LoadFX( "misc/gulag_cafe_spotlight" );
	
	treadfx_override();
}

treadfx_override()
{
	driving_tread_fx = "treadfx/tread_dust_boneyard";
	
	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "brick", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "bark", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "carpet", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "cloth", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "concrete", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "dirt", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "flesh", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "foliage", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "glass", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "grass", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "gravel", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "ice", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "metal", undefined );
 	//maps\mp\favela_escape_fx2::setvehiclefx( "technical", "mud", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "paper", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "plaster", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "rock", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "sand", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "snow", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "slush", driving_tread_fx );
 	//maps\mp\favela_escape_fx2::setvehiclefx( "technical", "water", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "wood", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "asphalt", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "ceramic", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "plastic", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "rubber", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "cushion", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "fruit", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "painted metal", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical", "default", driving_tread_fx );
	//maps\mp\favela_escape_fx2::setvehiclefx( "technical", "none", driving_tread_fx );
	
	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "brick", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "bark", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "carpet", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "cloth", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "concrete", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "dirt", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "flesh", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "foliage", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "glass", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "grass", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "gravel", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "ice", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "metal", undefined );
 	//maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "mud", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "paper", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "plaster", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "rock", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "sand", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "snow", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "slush", driving_tread_fx );
 	//maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "water", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "wood", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "asphalt", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "ceramic", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "plastic", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "rubber", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "cushion", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "fruit", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "painted metal", driving_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "default", driving_tread_fx );
	//maps\mp\favela_escape_fx2::setvehiclefx( "technical_physics", "none", driving_tread_fx );
	
	
	flying_tread_fx = "treadfx/heli_dust_large";
	
	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "brick", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "bark", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "carpet", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "cloth", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "concrete", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "dirt", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "flesh", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "foliage", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "glass", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "grass", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "gravel", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "ice", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "metal", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "mud", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "paper", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "plaster", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "rock", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "sand", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "snow", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "water", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "wood", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "asphalt", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "ceramic", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "plastic", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "rubber", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "cushion", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "fruit", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "painted metal", flying_tread_fx );
 	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "default", flying_tread_fx );
	maps\mp\favela_escape_fx2::setvehiclefx( "pavelow", "none", flying_tread_fx );
}