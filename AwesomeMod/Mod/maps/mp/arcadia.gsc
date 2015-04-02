#include common_scripts\utility;
#include maps\mp\_utility;

main()
{
	precache_masked_destructibles()

	maps\createart\arcadia_art::main(); //remove fog/fix load vision

	maps\mp\_load::main();

	ambientPlay( "ambient_arcadia_ext3" ); //play sounds

	game[ "attackers" ] = "allies";
	game[ "defenders" ] = "axis";

	maps\mp\arcadia_fx::main();

	//compass stuff
	maps\mp\_compass::setupMiniMap( "compass_map_arcadia" );
	setdvar( "compassmaxrange", "5000" );

	//airstrike stuff
	level.airstrikeHeightScale = 3;
}
precache_masked_destructibles()
{
	loadfx( "smoke/car_damage_whitesmoke" );
	loadfx( "smoke/car_damage_blacksmoke" );
	loadfx( "smoke/car_damage_blacksmoke_fire" );
	loadfx( "explosions/small_vehicle_explosion" );
	loadfx( "props/car_glass_large" );
	loadfx( "props/car_glass_med" );
	loadfx( "props/car_glass_headlight" );
	loadfx( "smoke/motorcycle_damage_blacksmoke_fire" );
	loadfx( "props/car_glass_brakelight" );
	loadfx( "props/mail_box_explode" );
	loadfx( "props/garbage_spew_des" );
	loadfx( "props/garbage_spew" );
	loadfx( "explosions/wallfan_explosion_dmg" );
	loadfx( "explosions/wallfan_explosion_des" );
	loadfx( "props/filecabinet_dam" );
	loadfx( "props/filecabinet_des" );
	loadfx( "misc/light_blowout_runner" );
	loadfx( "props/electricbox4_explode" );
	loadfx( "explosions/ceiling_fan_explosion" );
	loadfx( "props/firehydrant_leak" );
	loadfx( "props/firehydrant_exp" );
	loadfx( "props/firehydrant_spray_10sec" );
	loadfx( "explosions/tv_flatscreen_explosion" );
	
	precachemodel( "ma_flatscreen_tv_wallmount_broken_02" );
	precachemodel( "vehicle_van_green_destructible" );
	precachemodel( "vehicle_van_green_destroyed" );
	precachemodel( "vehicle_van_green_hood" );
	precachemodel( "vehicle_van_green_door_rb" );
	precachemodel( "vehicle_van_green_mirror_l" );
	precachemodel( "vehicle_van_green_mirror_r" );
	precachemodel( "vehicle_van_wheel_lf" );
	precachemodel( "vehicle_pickup_destructible_mp" );
	precachemodel( "vehicle_pickup_destroyed" );
	precachemodel( "vehicle_pickup_hood" );
	precachemodel( "vehicle_pickup_door_lf" );
	precachemodel( "vehicle_pickup_door_rf" );
	precachemodel( "vehicle_pickup_mirror_l" );
	precachemodel( "vehicle_pickup_mirror_r" );
	precachemodel( "vehicle_luxurysedan_2008_white_destructible" );
	precachemodel( "vehicle_luxurysedan_2008_white_destroy" );
	precachemodel( "vehicle_luxurysedan_2008_white_hood" );
	precachemodel( "vehicle_luxurysedan_2008_white_wheel_lf" );
	precachemodel( "vehicle_luxurysedan_2008_white_door_lf" );
	precachemodel( "vehicle_luxurysedan_2008_white_door_rf" );
	precachemodel( "vehicle_luxurysedan_2008_white_door_lb" );
	precachemodel( "vehicle_luxurysedan_2008_white_door_rb" );
	precachemodel( "vehicle_luxurysedan_2008_white_mirror_l" );
	precachemodel( "vehicle_luxurysedan_2008_white_mirror_r" );
	precachemodel( "vehicle_coupe_gold_destructible" );
	precachemodel( "vehicle_coupe_gold_destroyed" );
	precachemodel( "vehicle_coupe_gold_door_lf" );
	precachemodel( "vehicle_coupe_gold_spoiler" );
	precachemodel( "vehicle_coupe_gold_mirror_l" );
	precachemodel( "vehicle_coupe_gold_mirror_r" );
	precachemodel( "vehicle_coupe_black_destructible" );
	precachemodel( "vehicle_coupe_black_destroyed" );
	precachemodel( "vehicle_coupe_black_door_lf" );
	precachemodel( "vehicle_coupe_black_spoiler" );
	precachemodel( "vehicle_coupe_black_mirror_l" );
	precachemodel( "vehicle_coupe_black_mirror_r" );
	precachemodel( "vehicle_suburban_destructible_beige" );
	precachemodel( "vehicle_suburban_destroyed_beige" );
	precachemodel( "vehicle_suburban_wheel_rf" );
	precachemodel( "vehicle_suburban_door_lb_beige" );
	precachemodel( "vehicle_motorcycle_01_destructible" );
	precachemodel( "vehicle_motorcycle_01_destroy" );
	precachemodel( "vehicle_motorcycle_01_front_wheel_d" );
	precachemodel( "vehicle_motorcycle_01_rear_wheel_d" );
	precachemodel( "vehicle_motorcycle_02_destructible" );
	precachemodel( "vehicle_motorcycle_02_destroy" );
	precachemodel( "vehicle_policecar_lapd_destructible" );
	precachemodel( "vehicle_policecar_lapd_destroy" );
	precachemodel( "vehicle_policecar_lapd_wheel_lf" );
	precachemodel( "vehicle_policecar_lapd_door_lf" );
	precachemodel( "vehicle_policecar_lapd_door_rf" );
	precachemodel( "vehicle_policecar_lapd_door_lb" );
	precachemodel( "vehicle_policecar_lapd_mirror_l" );
	precachemodel( "vehicle_policecar_lapd_mirror_r" );
	precachemodel( "mailbox_black" );
	precachemodel( "mailbox_black_dam" );
	precachemodel( "mailbox_black_dest" );
	precachemodel( "mailbox_black_door" );
	precachemodel( "mailbox_black_flag" );
	precachemodel( "com_trashbin02" );
	precachemodel( "com_trashbin02_dmg" );
	precachemodel( "com_trashbin02_lid" );
	precachemodel( "com_recyclebin01" );
	precachemodel( "com_recyclebin01_dmg" );
	precachemodel( "com_recyclebin01_lid" );
	precachemodel( "cs_wallfan1" );
	precachemodel( "cs_wallfan1_dmg" );
	precachemodel( "com_filecabinetblackclosed" );
	precachemodel( "com_filecabinetblackclosed_dam" );
	precachemodel( "com_filecabinetblackclosed_des" );
	precachemodel( "com_filecabinetblackclosed_drawer" );
	precachemodel( "com_light_ceiling_round_on" );
	precachemodel( "com_light_ceiling_round_off" );
	precachemodel( "me_electricbox2" );
	precachemodel( "me_electricbox2_dest" );
	precachemodel( "me_electricbox2_door" );
	precachemodel( "me_electricbox2_door_upper" );
	precachemodel( "me_electricbox4" );
	precachemodel( "me_electricbox4_dest" );
	precachemodel( "me_electricbox4_door" );
	precachemodel( "me_fanceil1" );
	precachemodel( "me_fanceil1_des" );
	precachemodel( "com_trashbin01" );
	precachemodel( "com_trashbin01_dmg" );
	precachemodel( "com_trashbin01_lid" );
	precachemodel( "com_firehydrant" );
	precachemodel( "com_firehydrant_dest" );
	precachemodel( "com_firehydrant_dam" );
	precachemodel( "com_firehydrant_cap" );
}