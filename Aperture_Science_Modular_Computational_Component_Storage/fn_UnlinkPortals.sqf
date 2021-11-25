// Copyright 2021 Sysroot/Eisenhorn

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

/// Description: "Unlinks" the portals by disabling their cameras and PiP.
/// Parameters:
///		PARAMETER		|		EXPECTED INPUT TYPE		|		DESCRIPTION
///
///		bPortal			|		Object					|		The blue portal.
///		oPortal			|		Object					|		The orange portal.
///
///	Return value: None.

params["_bPortal", "_oPortal"];

private _blueCam = PG_REMOTE_BLUE_CAM;
private _orangeCam = PG_REMOTE_ORANGE_CAM;

// Reset blue portal and cams
PG_VAR_BLUE_PORTAL setObjectMaterialGlobal [1, PG_BLUE_NOISE_MAT];
PG_VAR_BLUE_PORTAL setObjectTextureGlobal [1, PG_BLUE_NOISE_TEX];
PG_VAR_BLUE_PORTAL animateSource ["Portal_Noise_Source", 100000, 1];
_blueCam cameraEffect ["terminate", "back", format["piprenderbp%1", clientOwner]];
detach _blueCam;
camDestroy _blueCam;
_blueCam = objNull;
PG_VAR_BLUE_SS setPosWorld [0,0,0];

// Reset orange portal and cams
PG_VAR_ORANGE_PORTAL setObjectMaterialGlobal [1, PG_ORANGE_NOISE_MAT];
PG_VAR_ORANGE_PORTAL setObjectTextureGlobal [1, PG_ORANGE_NOISE_TEX]; 
PG_VAR_ORANGE_PORTAL animateSource ["Portal_Noise_Source", 100000, 1];
_orangeCam cameraEffect ["terminate", "back", format["piprenderop%1", clientOwner]];
detach _orangeCam;
camDestroy _orangeCam;
_orangeCam = objNull;
PG_VAR_ORANGE_SS setPosWorld [0,0,0];