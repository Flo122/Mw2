#include common_scripts\utility;

main()
{
precacheModel("head_urban_civ_female_a");
precacheModel("head_urban_civ_female_b");

	//MAIN
	maps\mp\_load::main();

	game[ "attackers" ] = "axis";
	game[ "defenders" ] = "allies";

	maps\mp\_compass::setupMiniMap( "compass_map_airport" );
	setdvar( "compassmaxrange", "3000");
	
	maps\mp\airport_fx::main();
	maps\mp\mp_terminal_fx::main();
	maps\createfx\airport_fx::main();
	maps\createart\airport_art::main();

	//DEPARTURE SIGNS
	sign_departure_status_init();

	foreach (sign in level.departure_status_array) {
		if (randomInt(2) == 1) {
			sign sign_departure_status_flip_to( "arriving" );
		}
		if (randomInt(10) == 1) {
			sign sign_departure_status_flip_to( "boarding" );
		}
	}

	self thread sign_departure_status_delayed_flips();
	
}

sign_departure_status_delayed_flips()
{
	level.departure_status_array[13] sign_departure_status_flip_to("delayed");
	wait(20);
	foreach(sign in level.departure_status_array)
	{
		if (sign.current_state != "delayed") sign thread sign_departure_status_flip_to( "delayed" );
		wait(20);
	}
}

sign_departure_status_init()
{
	array = sign_departure_status_system_setup();
	array_thread( array, ::sign_departure_status_tab_setup );

	level.departure_status_array = array;
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
	self.status[ "angles" ] 		= [];
	self.status[ "angles" ][ "bottom" ] 	= self.tabs[ "ontime" ].angles;
	self.status[ "angles" ][ "top" ] 	= self.tabs[ "boarding" ].angles;
	self.status[ "angles" ][ "waiting" ] 	= self.tabs[ "delayed" ].angles;

	self.status[ "order" ] 			= [];
	self.status[ "order" ][ "ontime" ] 	= "arriving";
	self.status[ "order" ][ "arriving" ] 	= "boarding";
	self.status[ "order" ][ "boarding" ] 	= "delayed";
	self.status[ "order" ][ "delayed" ] 	= "ontime";

	self.status[ "ontime" ] 		= [];
	self.status[ "ontime" ][ "bottom" ]	= "ontime";
	self.status[ "ontime" ][ "top" ] 	= "arriving";

	self.status[ "arriving" ] 		= [];
	self.status[ "arriving" ][ "bottom" ]	= "arriving";
	self.status[ "arriving" ][ "top" ]	= "boarding";

	self.status[ "boarding" ] 		= [];
	self.status[ "boarding" ][ "bottom" ]	= "boarding";
	self.status[ "boarding" ][ "top" ] 	= "delayed";

	self.status[ "delayed" ] 		= [];
	self.status[ "delayed" ][ "bottom" ] 	= "delayed";
	self.status[ "delayed" ][ "top" ] 	= "ontime";

	self.current_state			= "ontime";

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
		bottomtab   	 = self.tabs[ bottomname ];
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