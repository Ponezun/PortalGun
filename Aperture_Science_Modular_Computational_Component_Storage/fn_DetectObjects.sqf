// Copyright 2021/2022 Sysroot/Eisenhorn

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

    // http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "macros.hpp"

/// Description: Performs object detection for portal teleportation.
/// Parameters:
///		PARAMETER		|		EXPECTED INPUT TYPE		|		DESCRIPTION
///
///		bPortal			|		Object					|		The blue portal.
///		oPortal			|		Object					|		The orange portal.
///
///	Return value: Array of arrays in format [[object, velocity, isProjectile]].

#ifdef ASHPD_VERBOSE_DEBUG
ASHPD_LOG_FUNC("DetectObjects");
#endif

params[["_bPortal", objNull, [objNull]], ["_oPortal", objNull, [objNull]]];

private _nearObjects = [[], []];
{
	private _portalObj = _x;
	private _nearPortal = [];
	private _obj = objNull;
	
	// Detect all projectile types
	{
		private ["_objPos", "_rayCast", "_temp"];
		// Iterate over all projectiles of a given type near the portal
		{
			_temp = [_x, velocity _x, true];
			_objPos = getPosWorld _x;
			// Do a raycast to make sure we're only grabbing projectiles that are actually entering the portal
			_rayCast = lineIntersectsSurfaces [_objPos, _objPos vectorAdd ((velocity _x) vectorMultiply ASHPD_VAR_MAX_RANGE), player, objNull, true, 1, "VIEW", "GEOM"];
			if ((_rayCast findIf {(_x#2) isKindOf "Portal"}) == 0) then {
				// Delete the original projectile before it hits the portal, save its velocity for later 
				deleteVehicle _x; 
				_nearPortal pushBack _temp;
			};
		} forEach (_portalObj nearObjects [_x, ASHPD_VAR_PROJECTILE_GRAB_RANGE]);
	} forEach ASHPD_VAR_PROJECTILE_TYPES;
	
	// Detect grenades, PhysX objects, units, and vehicles
	{
		_nearPortal pushBackUnique _x;
	} forEach ((_portalObj nearObjects ["Grenade", ASHPD_VAR_MAX_GRAB_RANGE]) apply {[_x, velocity _x, false]});
	{
		_nearPortal pushBackUnique _x;
	} forEach ((_portalObj nearObjects ["ThingX", ASHPD_VAR_MAX_GRAB_RANGE]) apply {[_x, velocity _x, false]});
	{
		_nearPortal pushBackUnique _x;
	} forEach ((_portalObj nearObjects ["CAManBase", ASHPD_VAR_UNIT_GRAB_RANGE]) apply {[_x, velocity _x, false]});
	{
		private _vehicle = _x#0;
		// Ignore units, those are detected differently above
		if (_vehicle isKindOf "CAManBase") then { continue };
		private _distance = _portalObj distance _vehicle;
		// Bounding sphere diameter
		private _vehicleSize = (boundingBoxReal _vehicle)#2;
		// Only teleport the vehicle if its distance to the portal is less than its bounding diameter
		if (_distance <= _vehicleSize * 3/4) then {
			_nearPortal pushBackUnique _x;
		};
	} forEach ((_portalObj nearObjects ["AllVehicles", ASHPD_VAR_VEHICLE_GRAB_RANGE]) apply {[_x, velocity _x, false]});
	
	// Filter out portals and portal surfaces
	_nearPortal = _nearPortal select {
		_obj = _x#0;
		!(_obj isKindOf "Portal") && {!(_obj in ASHPD_VAR_PORTAL_SURFACES)}
	};
	_nearObjects set [_forEachIndex, _nearPortal];
	
} forEach [_bPortal, _oPortal];

private _nearBlue = (_nearObjects#0) apply {_x#0};
private _nearOrange = (_nearObjects#1) apply {_x#0};
// Only keep objects in the cache that have either not been teleported or are within the detection range of the portals
ASHPD_VAR_TP_CACHE = ASHPD_VAR_TP_CACHE select {!(_x getVariable ["ASHPD_TPED", false]) || {_x in _nearBlue || {_x in _nearOrange}}};

// Don't teleport any objects already in ASHPD_VAR_TP_CACHE, add to-be-teleported objects to cache
{
	_nearObjects set [_forEachIndex, _x select {
		_obj = _x#0;
		if !(_obj in ASHPD_VAR_TP_CACHE) then {
			// Mark the object as not yet teleported
			_obj setVariable ["ASHPD_TPED", false];
			// Add object to cache
			ASHPD_VAR_TP_CACHE pushBack _obj;
			true;
		} else {
			false;
		};
	}];
} forEach _nearObjects;

_nearObjects;