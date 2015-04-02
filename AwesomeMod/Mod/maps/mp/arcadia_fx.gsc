#include common_scripts\utility;
#include maps\mp\_utility;

main()
{
        level._effect[ "leaves_spiral_runner" ]                         = LoadFX( "misc/leaves_spiral_runner" );
	level._effect[ "smoke_plume02" ]                                = LoadFX( "smoke/smoke_plume02" );
	level._effect[ "room_smoke_200" ] 				= LoadFX( "smoke/room_smoke_200" );
	level._effect[ "ground_fog_a" ] 				= LoadFX( "dust/ground_fog_a" );
	level._effect[ "ground_fog_b" ] 				= LoadFX( "dust/ground_fog_b" );
	level._effect[ "trash_spiral_runner" ] 				= LoadFX( "misc/trash_spiral_runner" );
	level._effect[ "airplane_crash_embers" ] 			= LoadFX( "fire/airplane_crash_embers" );
	level._effect[ "powerline_runner" ] 				= LoadFX( "explosions/powerline_runner" );
	level._effect[ "powerline_runner_cheap" ] 			= LoadFX( "explosions/powerline_runner_cheap" );
	level._effect[ "fire_falling_runner_point" ] 			= LoadFX( "fire/fire_falling_runner_point" );
	level._effect[ "fire_falling_runner_point_infrequent" ] 	= LoadFX( "fire/fire_falling_runner_point_infrequent" );
	level._effect[ "firelp_huge_pm_nolight" ] 			= LoadFX( "fire/firelp_huge_pm_nolight" );
	level._effect[ "firelp_large_pm_far" ] 				= LoadFX( "fire/firelp_large_pm_far" );
	level._effect[ "firelp_med_pm_far" ] 				= LoadFX( "fire/firelp_med_pm_far" );
	level._effect[ "firelp_large_pm_nolight" ] 			= LoadFX( "fire/firelp_large_pm_nolight" );
	level._effect[ "firelp_med_pm_nolight" ] 			= LoadFX( "fire/firelp_med_pm_nolight" );
	level._effect[ "firelp_small_pm_a_nolight" ] 			= LoadFX( "fire/firelp_small_pm_a_nolight" );
	level._effect[ "firelp_large_pm_nolight_high" ] 		= LoadFX( "fire/firelp_large_pm_nolight_high" );
	level._effect[ "firelp_med_pm_nolight_high" ] 			= LoadFX( "fire/firelp_med_pm_nolight_high" );
	level._effect[ "leaves_fall_gentlewind" ] 			= LoadFX( "misc/leaves_fall_gentlewind" );
	level._effect[ "leaves_fall_gentlewind_far" ] 			= LoadFX( "misc/leaves_fall_gentlewind_far" );
	level._effect[ "leaves_ground_gentlewind" ] 			= LoadFX( "misc/leaves_ground_gentlewind" );
	level._effect[ "battlefield_smokebank_S_warm" ] 		= LoadFX( "smoke/battlefield_smokebank_S_warm" );
	level._effect[ "battlefield_smokebank_S_warm_thick" ] 		= LoadFX( "smoke/battlefield_smokebank_S_warm_thick" );
	level._effect[ "insect_trail_runner_icbm" ] 			= LoadFX( "misc/insect_trail_runner_icbm" );
	level._effect[ "insects_light_invasion" ] 			= LoadFX( "misc/insects_light_invasion" );
	level._effect[ "waterfall_splash_arcadia" ] 			= LoadFX( "water/waterfall_splash_arcadia" );
	level._effect[ "waterfall_splash_arcadia_short" ] 		= LoadFX( "water/waterfall_splash_arcadia_short" );

	level.scr_sound[ "mortar_incomming" ]				= "mortar_incoming";
	level.scr_sound[ "mortar_grass" ]				= "mortar_explosion";
	level.scr_sound[ "mortar_sand" ]				= "mortar_explo sion";
	
	maps\createfx\arcadia_fx::main();
}
