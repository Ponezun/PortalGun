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

// ------------------ DEBUG OPTIONS ---------------------------

// Uncomment below line for normal debug

#define PG_DEBUG

// Uncomment below line for verbose debug

//#define PG_VERBOSE_DEBUG

// ------------------------------------------------------------

// Debug logging
#define PG_LOG_FUNC(fnc) (diag_log text format [localize "$STR_PGUN_LOG_STR", fnc, _this])
// NOTE: Macros can't take array args, pass format args for this in PG_VAR_LOG_VARS!
#define PG_LOG(str) (diag_log text format ([localize str] + PG_VAR_LOG_VARS))

// Values
#define PG_VAR_PORTAL_HEIGHT 2
#define PG_VAR_PORTAL_WIDTH 1.2
#define PG_VAR_PORTAL_HEIGHT_H 1
#define PG_VAR_PORTAL_WIDTH_H 0.6

// Error messages
#define PG_ERROR(msg) ([] spawn {[localize msg, localize "$STR_PGUN_Error_Header", true, false, [] call BIS_fnc_displayMission, false, false] call BIS_fnc_guiMessage})

// Cameras
#define PG_REMOTE_BLUE_CAM (missionNameSpace getVariable [format["PG_VAR_BCAM%1", remoteExecutedOwner], objNull])
#define PG_REMOTE_ORANGE_CAM (missionNameSpace getVariable [format["PG_VAR_OCAM%1", remoteExecutedOwner], objNull])

// Portal gun settings
#define PG_DUAL_PORTALS (PG_VAR_INIT_SETTINGS isEqualTo [true, true])
#define PG_BLUE_ONLY (PG_VAR_INIT_SETTINGS isEqualTo [true, false])
#define PG_ORANGE_ONLY (PG_VAR_INIT_SETTINGS isEqualTo [false, true])

// Crosshair image paths
#define PG_CROSSHAIR_DUAL_EMPTY "\PortalGun\Aperture_Science_Directional_Assistance_Navigational_Overlay_Correspondant\portal_dual_empty.paa"
#define PG_CROSSHAIR_DUAL_FULL "\PortalGun\Aperture_Science_Directional_Assistance_Navigational_Overlay_Correspondant\portal_dual_full.paa"
#define PG_CROSSHAIR_DUAL_BLUE "\PortalGun\Aperture_Science_Directional_Assistance_Navigational_Overlay_Correspondant\portal_dual_blue.paa"
#define PG_CROSSHAIR_DUAL_ORANGE "\PortalGun\Aperture_Science_Directional_Assistance_Navigational_Overlay_Correspondant\portal_dual_orange.paa"
#define PG_CROSSHAIR_BLUE "\PortalGun\Aperture_Science_Directional_Assistance_Navigational_Overlay_Correspondant\portal_blue_full.paa"
#define PG_CROSSHAIR_BLUE_EMPTY "\PortalGun\Aperture_Science_Directional_Assistance_Navigational_Overlay_Correspondant\portal_blue_empty.paa"
#define PG_CROSSHAIR_ORANGE "\PortalGun\Aperture_Science_Directional_Assistance_Navigational_Overlay_Correspondant\portal_orange_full.paa"
#define PG_CROSSHAIR_ORANGE_EMPTY "\PortalGun\Aperture_Science_Directional_Assistance_Navigational_Overlay_Correspondant\portal_orange_empty.paa"

// Portal texture/material paths
#define PG_BLUE_NOISE_TEX "\PortalGun\Aperture_Science_Woof_Containment_Vessel\noise_blue.paa"
#define PG_ORANGE_NOISE_TEX "\PortalGun\Aperture_Science_Woof_Containment_Vessel\noise_orange.paa"
#define PG_BLUE_NOISE_MAT "\PortalGun\Aperture_Science_Woof_Containment_Vessel\Portalflat_blue.rvmat"
#define PG_ORANGE_NOISE_MAT "\PortalGun\Aperture_Science_Woof_Containment_Vessel\Portalflat_orange.rvmat"

#define PG_BLUE_EDGE_TEX "\PortalGun\Aperture_Science_Woof_Containment_Vessel\beam_portaledge_blue.paa"
#define PG_ORANGE_EDGE_TEX "\PortalGun\Aperture_Science_Woof_Containment_Vessel\beam_portaledge_orange.paa"
#define PG_BLUE_EDGE_MAT "\PortalGun\Aperture_Science_Woof_Containment_Vessel\beam_portaledge_blue.rvmat"
#define PG_ORANGE_EDGE_MAT "\PortalGun\Aperture_Science_Woof_Containment_Vessel\beam_portaledge_orange.rvmat"

#define PG_BLUE_PIP_TEX "#(argb,512,512,1)r2t(piprenderbp%1,1)"
#define PG_ORANGE_PIP_TEX "#(argb,512,512,1)r2t(piprenderop%1,1)"
#define PG_PIP_MAT "\PortalGun\Aperture_Science_Woof_Containment_Vessel\PortalflatPiP.rvmat"

// Camera effects
#define PG_BLUE_PIP_EFFECT ["Internal", "Back", format["piprenderbp%1", remoteExecutedOwner]]
#define PG_ORANGE_PIP_EFFECT ["Internal", "Back", format["piprenderop%1", remoteExecutedOwner]]

// Portal colors (currently unused)
#define PG_BLUE "0, 0.447, 0.823"
#define PG_ORANGE "0.992, 0.510, 0"

// Vital components
#define CAKE_JPG "\PortalGun\cake.jpg"