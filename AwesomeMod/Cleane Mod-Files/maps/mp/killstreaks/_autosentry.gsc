//////////////////////////////////////////////
//////////////////////////////////////////////
/////////Custom Sentry Gun///////////////////
/////////by Yamato///////////////////////////
/////////////////////////////////////////////

SENTRY_MODE_ON = "sentry";
SENTRY_MODE_OFF = "sentry_offline";
SENTRY_TIME_OUT = 75.0;
SENTRY_SPINUP_TIME = .05;
SENTRY_OVERHEAT_TIME = 0.05;
SENTRY_FX_TIME = .3;

init()
{
level.sentryType = [];
level.sentryType[ "sentry_minigun" ] = "sentry";

level.killStreakFuncs[ level.sentryType[ "sentry_minigun" ] ] = ::tryUseAutoSentry;

level.sentrySettings = [];

level.sentrySettings[ "sentry_minigun" ] = spawnStruct();
level.sentrySettings[ "sentry_minigun" ].weaponInfo = "sentry_minigun_mp";
level.sentrySettings[ "sentry_minigun" ].modelBase = "sentry_minigun";
level.sentrySettings[ "sentry_minigun" ].modelPlacement = "sentry_minigun_obj";
level.sentrySettings[ "sentry_minigun" ].modelPlacementFailed = "sentry_minigun_obj_red";
level.sentrySettings[ "sentry_minigun" ].modelDestroyed = "sentry_minigun_destroyed";

foreach ( sentryInfo in level.sentrySettings )
{
precacheItem( sentryInfo.weaponInfo );
precacheModel( sentryInfo.modelBase ); 
precacheModel( sentryInfo.modelPlacement ); 
precacheModel( sentryInfo.modelPlacementFailed ); 
precacheModel( sentryInfo.modelDestroyed ); 
}

level._effect[ "sentry_overheat_mp" ] = loadfx( "smoke/sentry_turret_overheat_smoke" );
level._effect[ "sentry_explode_mp" ] = loadfx( "explosions/sentry_gun_explosion" );
level._effect[ "sentry_smoke_mp" ] = loadfx( "smoke/car_damage_blacksmoke" );
}

/* ============================
Killstreak Functions
============================ */

tryUseAutoSentry( lifeId )
{
result = self giveSentry( "sentry_minigun" );
if ( result )
self maps\mp\_matchdata::logKillstreakEvent( "sentry", self.origin );

return ( result );
}


tryUseAutoGlSentry( lifeId )
{
result = self giveSentry( "sentry_gun" );
if ( result )
self maps\mp\_matchdata::logKillstreakEvent( "sentry_gl", self.origin );

return ( result );
}


giveSentry( sentryType )
{
self.last_sentry = sentryType;

sentryGun = createSentryForPlayer( sentryType, self );

self setCarryingSentry( sentryGun, true );

if ( isDefined( sentryGun ) )
return true;
else
return false;
}


/* ============================
Player Functions
============================ */


setCarryingSentry( sentryGun, allowCancel )
{
self endon ( "death" );
self endon ( "disconnect" );

assert( isReallyAlive( self ) );

sentryGun sentry_setCarried( self );

self _disableWeapon();

self notifyOnPlayerCommand( "place_sentry", "+attack" );
self notifyOnPlayerCommand( "cancel_sentry", "+actionslot 4" );

for ( ;; )
{
result = waittill_any_return( "place_sentry", "cancel_sentry" );

if ( result == "cancel_sentry" )
{
if ( !allowCancel )
continue;

sentryGun sentry_setCancelled();
self _enableWeapon();
return false;
}

if ( !sentryGun.canBePlaced )
continue;

sentryGun sentry_setPlaced();
self _enableWeapon();

return true;
}
}

defaultAngles()
{
self setPlayerAngles(self.angles+(0,0,0));
}

/* ============================
Sentry Functions
============================ */

createSentryForPlayer( sentryType, owner )
{
assertEx( isDefined( owner ), "createSentryForPlayer() called without owner specified" );

sentryGun = spawnTurret( "misc_turret", owner.origin, level.sentrySettings[ sentryType ].weaponInfo );
sentryGun.angles = owner.angles;
sentryGun LaserOn();

sentryGun sentry_initSentry( sentryType, owner );

return ( sentryGun ); 
}


sentry_initSentry( sentryType, owner )
{
self.sentryType = sentryType;

self setModel( level.sentrySettings[ self.sentryType ].modelBase );
self.health = 1000;

self setCanDamage( true );

self setTurretModeChangeWait( true );
self sentry_setInactive();
self setDefaultDropPitch( -89.0 );

self sentry_setOwner( owner );
self thread sentry_handleOwner();
self thread sentry_handleDamage();
self thread sentry_handleDeath();
self thread sentry_timeOut();
}


/* ============================
Sentry Handlers
============================ */

sentry_handleDamage()
{
healthBuffer = 20000;
self.health += healthbuffer;

while ( self.health > 0 )
{
self waittill( "damage", amount, attacker, dir, point, type );

if ( isDefined( attacker ) && isPlayer( attacker ) && attacker != self.owner && attacker isFriendlyToSentry( self ) && !isDefined( level.nukeDetonated ) )
{
self.health += amount;
continue;
}

if ( isExplosiveDamage( type ) )
self.health -= (amount * 1);

if ( type == "MOD_MELEE" )
self.health = 0;

if ( isPlayer( attacker ) )
{
attacker maps\mp\gametypes\_damagefeedback::updateDamageFeedback( "sentry" );

if ( attacker _hasPerk( "specialty_armorpiercing" ) )
{
damageAdd = amount*level.armorPiercingMod;
self.health -= int(damageAdd);
} 
}

if ( self.health - healthbuffer < 0 )
{
thread maps\mp\gametypes\_missions::vehicleKilled( self.owner, self, undefined, attacker, amount, type );

if ( isPlayer( attacker ) && (!isDefined(self.owner) || attacker != self.owner) )
{
attacker thread maps\mp\gametypes\_rank::giveRankXP( "kill", 100 ); 
attacker notify( "destroyed_killstreak" );
}

if ( isDefined( self.owner ) )
self.owner thread leaderDialogOnPlayer( "sentry_destroyed" );

self notify ( "death" );
return;
}
}
}

sentry_handleDeath()
{
entNum = self GetEntityNumber();

self addToTurretList( entNum );

self waittill ( "death" );

self removeFromTurretList( entNum );
if ( !isDefined( self ) )
return;

self setModel( level.sentrySettings[ self.sentryType ].modelDestroyed );

self sentry_setInactive();
self makeTurretInoperable();
self setDefaultDropPitch( 40 );
self SetSentryOwner( undefined );
self SetTurretMinimapVisible( false );

self playSound( "sentry_explode" );
playFxOnTag( getFx( "sentry_explode_mp" ), self, "tag_aim" );

self endon ( "death" );

wait ( 1.5 );

self playSound( "sentry_explode_smoke" );
for ( smokeTime = 8; smokeTime > 0; smokeTime -= 0.4 )
{
playFxOnTag( getFx( "sentry_smoke_mp" ), self, "tag_aim" );
wait ( 0.4 );
}

self delete();
}

sentry_handleOwner()
{
self endon ( "death" );
level endon ( "game_ended" );

self notify ( "sentry_handleOwner" );
self endon ( "sentry_handleOwner" );

self.owner waittill_any( "disconnect", "joined_team", "joined_spectators" );

self notify( "death" );
}


/* ============================
Sentry Utility Functions
============================ */

sentry_setOwner( owner )
{
assertEx( isDefined( owner ), "sentry_setOwner() called without owner specified" );
assertEx( isPlayer( owner ), "sentry_setOwner() called on non-player entity type: " + owner.classname );

self.owner = owner;

self SetSentryOwner( self.owner );
self SetTurretMinimapVisible( true );

if ( level.teamBased )
{
self.team = self.owner.team;
self setTurretTeam( self.team );
}

self thread sentry_handleOwner();
}


sentry_setPlaced()
{
self setModel( level.sentrySettings[ self.sentryType ].modelBase );

self setSentryCarried( false );
self setCanDamage( true );
self sentry_makeSolid();

self.carriedBy forceUseHintOff();
self.carriedBy = undefined;

self sentry_setActive();

self playSound( "sentry_gun_plant" );

self notify ( "placed" );
}


sentry_setCancelled()
{
self.carriedBy forceUseHintOff();

self delete();
}


sentry_setCarried( carrier )
{
assert( isPlayer( carrier ) );
assertEx( carrier == self.owner, "sentry_setCarried() specified carrier does not own this sentry" );

self setModel( level.sentrySettings[ self.sentryType ].modelPlacement );

self setSentryCarried( true );
self setCanDamage( false );
self sentry_makeNotSolid();

self.carriedBy = carrier;

carrier thread updateSentryPlacement( self );

self thread sentry_onCarrierDeath( carrier );
self thread sentry_onCarrierDisconnect( carrier );
self thread sentry_onGameEnded();

self sentry_setInactive();

self notify ( "carried" );
}

updateSentryPlacement( sentryGun )
{
self endon ( "death" );
self endon ( "disconnect" );
level endon ( "game_ended" );

sentryGun endon ( "placed" );
sentryGun endon ( "death" );

sentryGun setModel( level.sentrySettings[ sentryGun.sentryType ].modelPlacement );
self ForceUseHintOn( &"SENTRY_PLACE" );

for( ;; )
{
placement = self canPlayerPlaceSentry();

sentryGun.origin = placement[ "origin" ];
sentryGun.angles = placement[ "angles" ]; 
wait ( 0.05 );
}
}

sentry_onCarrierDeath( carrier )
{
self endon ( "placed" );
self endon ( "death" );

carrier waittill ( "death" );

if ( self.canBePlaced )
self sentry_setPlaced();
else
self delete();
}


sentry_onCarrierDisconnect( carrier )
{
self endon ( "placed" );
self endon ( "death" );

carrier waittill ( "disconnect" );

self delete();
}

sentry_onGameEnded( carrier )
{
self endon ( "placed" );
self endon ( "death" );

level waittill ( "game_ended" );

self delete();
}


sentry_setActive()
{
self setMode( SENTRY_MODE_ON );

self setCursorHint( "HINT_NOICON" );
self setHintString( &"SENTRY_PICKUP" );

self makeUsable();

foreach ( player in level.players )
{
if ( player == self.owner )
self enablePlayerUse( player );
else
self disablePlayerUse( player ); 
} 
}


sentry_setInactive()
{
self setMode( SENTRY_MODE_OFF );
self makeUnusable();
}

sentry_makeSolid()
{
self makeTurretSolid();
}


sentry_makeNotSolid()
{
self setContents( 0 );
}


isFriendlyToSentry( sentryGun )
{
if ( level.teamBased && self.team == sentryGun.team )
return true;

return false;
}


addToTurretList( entNum )
{
level.turrets[entNum] = self; 
}


removeFromTurretList( entNum )
{
level.turrets[entNum] = undefined;
}

/* ============================
Sentry Logic Functions
============================ */

sentry_timeOut()
{
self endon( "death" );
level endon ( "game_ended" );

lifeSpan = SENTRY_TIME_OUT;

while ( lifeSpan )
{
wait ( 1.0 );
maps\mp\gametypes\_hostmigration::waitTillHostMigrationDone();

if ( !isDefined( self.carriedBy ) )
lifeSpan = max( 0, lifeSpan - 1.0 );
}

if ( isDefined( self.owner ) )
self.owner thread leaderDialogOnPlayer( "sentry_gone" );

self notify ( "death" );
}