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

/// Description: Adds items to the server's "garbage collector" for the player matching the given UID. Must be remoteExecuted on the server.
/// Parameters:
///		PARAMETER		|		EXPECTED INPUT TYPE		|		DESCRIPTION
///
///		UID				|		String					|		A player's UID.
///		Objects			|		Array					|		The global objects to destroy when this player disconnects.
///
///	Return value: None.

params ["_uID", ["_objects", [], [[]]]];

if !(_uID in ASHPD_VAR_GC) then {
	ASHPD_VAR_GC set [_uID, _objects];
} else {
	(ASHPD_VAR_GC get _uID) append _objects;
};