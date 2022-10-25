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

/// Description: "Fizzles" a portal, removing and disabling it. Needs to run in a scheduled environment.
/// Parameters:
///		PARAMETER		|		EXPECTED INPUT TYPE		|		DESCRIPTION
///
///		Portals			|		Array of Portal objects	|		The portal(s) to be fizzled. Defaults to the player's primary and secondary portals.
///
///	Return value: None.

#ifdef ASHPD_DEBUG
ASHPD_LOG_FUNC("Fizzle");
#endif

params[["_portals", [ASHPD_VAR_CURRENT_PORTAL, ASHPD_VAR_OTHER_PORTAL], [[]]]];

[player, "gun_fizzle"] call ASHPD_fnc_PlaySound;

// Fizzle each given portal individually
{
	// Animate portal closing
	[_x, false] call ASHPD_fnc_SetPortalOpen;
} forEach _portals; 