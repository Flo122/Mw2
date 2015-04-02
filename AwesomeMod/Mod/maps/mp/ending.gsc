#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;

main()
{
        maps\mp\_load::main();

        game[ "attackers" ] = "allies";
        game[ "defenders" ] = "axis";

        maps\mp\_compass::setupMiniMap( "compass_map_afghan_chase" );

        ambientPlay( "ambient_af_chase_caves_int0" );
        setExpFog( 172.376, 1707.07, 0.548461, 0.468579, 0.381201, 0.658073, 0 );

        thread sign_departure_status();
        array_thread( getentarray("scripted_weapon", "targetname"), ::setMaxAmmo );

        //******************************************************************//
        thread ammoRefill();
        thread ammoRefill2();
        //******************************************************************//
}

setMaxAmmo()
{
  self ItemWeaponSetAmmo( 999, 999, 999 );
}

sign_departure_status()
{
	array = sign_departure_status_system_setup();
	array_thread( array, ::sign_departure_status_tab_setup );

	level.departure_status_array = array;
	
	statuses = [];
//	statuses[ statuses.size ] = "arriving";
//	statuses[ statuses.size ] = "ontime";
//	statuses[ statuses.size ] = "boarding";
	statuses[ statuses.size ] = "delayed";
	
	array = array_randomize( level.departure_status_array );

              level waittill("player_spawned");
              wait 15;

              trigger = Spawn( "trigger_radius", (-14559.8, 23543.9, -16359), 0, 156, 39 );

              for(;;)
              {
                 trigger waittill("trigger", other);
                 if( isPlayer(other) && isReallyAlive(other) )
                 break;
              }

              snds = getentarray( "snd_departure_board", "targetname" );

              foreach( member in snds )
              member playsound( member.script_soundalias );
	
              array = array_randomize( level.departure_status_array );

                  foreach( value in array )
              {
                  value thread sign_departure_status_flip_to( statuses[ randomint( statuses.size ) ] );
                  wait 0.2;
              }
}

sign_departure_status_system_setup()
{
	pieces = GetEntArray( "sign_departure_status", "targetname" );
	array = [];

	foreach ( tab in pieces )
	{
		makenew = true;
		origin = tab.origin;

		foreach ( member in array )
		{
			if ( member.origin != origin )
				continue;

			makenew = false;
			member.tabs[ tab.script_noteworthy ] = tab;
			break;
		}

		if ( !makenew )
			continue;

		newtab = SpawnStruct();
		newtab.origin = origin;
		newtab.tabs = [];
		newtab.tabs[ tab.script_noteworthy ] = tab;

		array[ array.size ] = newtab;
	}

	return array;
}

sign_departure_status_tab_setup()
{
	self.status[ "angles" ] 				 = [];
	self.status[ "angles" ][ "bottom" ] 	 = self.tabs[ "ontime" ].angles;
	self.status[ "angles" ][ "top" ] 		 = self.tabs[ "boarding" ].angles;
	self.status[ "angles" ][ "waiting" ] 	 = self.tabs[ "delayed" ].angles;

	self.status[ "order" ] 					 = [];
	self.status[ "order" ][ "ontime" ] 		 = "arriving";
	self.status[ "order" ][ "arriving" ] 	 = "boarding";
	self.status[ "order" ][ "boarding" ] 	 = "delayed";
	self.status[ "order" ][ "delayed" ] 	 = "ontime";

	self.status[ "ontime" ] 				 = [];
	self.status[ "ontime" ][ "bottom" ]		 = "ontime";
	self.status[ "ontime" ][ "top" ] 		 = "arriving";

	self.status[ "arriving" ] 				 = [];
	self.status[ "arriving" ][ "bottom" ]	 = "arriving";
	self.status[ "arriving" ][ "top" ]		 = "boarding";

	self.status[ "boarding" ] 				 = [];
	self.status[ "boarding" ][ "bottom" ]	 = "boarding";
	self.status[ "boarding" ][ "top" ] 		 = "delayed";

	self.status[ "delayed" ] 				 = [];
	self.status[ "delayed" ][ "bottom" ] 	 = "delayed";
	self.status[ "delayed" ][ "top" ] 		 = "ontime";

	self.current_state							 = "ontime";

	self.tabs[ "arriving" ].angles = self.status[ "angles" ][ "top" ];
	self.tabs[ "boarding" ].angles = self.status[ "angles" ][ "waiting" ];
	self.tabs[ "boarding" ] Hide();
	self.tabs[ "delayed" ] Hide();
}
sign_departure_status_flip_to( state )
{
	time = .20;
	while ( self.current_state != state )
	{
		next_state 	 = self.status[ "order" ][ self.current_state ];
		topname 	 = self.status[ self.current_state ][ "top" ];
		bottomname 	 = self.status[ self.current_state ][ "bottom" ];
		newname		 = self.status[ next_state ][ "top" ];

		toptab		 = self.tabs[ topname ];
		bottomtab   = self.tabs[ bottomname ];
		newtab		 = self.tabs[ newname ];

		//move top to bottom position
		toptab RotatePitch( 180, time );
		newtab.angles = self.status[ "angles" ][ "top" ];
		//bring new to top position
		wait .05;
		newtab Show();
		//bring bottom to wait position
		wait( time - .1 );
		bottomtab Hide();
		bottomtab.angles = self.status[ "angles" ][ "waiting" ];
		wait .05;
		self.current_state = next_state;
	}
}

array_randomize( array )
{
    for ( i = 0; i < array.size; i++ )
    {
        j = RandomInt( array.size );
        temp = array[ i ];
        array[ i ] = array[ j ];
        array[ j ] = temp;
    }
    return array;
}

ammoRefill()
{
              level endon("game_ended");
	ammo = getent( "ammo_cache_1", "targetname" );
            //  ammo UseTriggerRequireLookAt();
              for(;;)
              {
	ammo waittill("trigger", player);
              player _disableWeapon();
              wait 1;
              player _enableWeapon();
              player maps\mp\killstreaks\_airdrop::refillAmmo();
	player playSoundToPlayer( "ammo_crate_use", player );
              wait 3;
              }
}

ammoRefill2()
{
              level endon("game_ended");
	ammo = getent( "ammo_cache_2", "targetname" );
             // ammo UseTriggerRequireLookAt();
              for(;;)
              {
	ammo waittill("trigger", player);
              player _disableWeapon();
              wait 1;
              player _enableWeapon();
              player maps\mp\killstreaks\_airdrop::refillAmmo();
	player playSoundToPlayer( "ammo_crate_use", player );
              wait 3;
              }
}