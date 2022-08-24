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

/// Description: Fixes an ArmA bug that causes PiP views to go black. Needs to run in scheduled environment.
/// Parameters: None.
///	Return value: None.

#ifdef ASHPD_DEBUG
ASHPD_LOG_FUNC("FixArsenalBug");
#endif

uiSleep 0.5; // Need this sleep here for some reason, otherwise PiP cameras remain black
[ASHPD_VAR_BLUE_PORTAL, ASHPD_VAR_ORANGE_PORTAL] remoteExecCall ["ASHPD_fnc_RefreshPiP", [0, -2] select ASHPD_VAR_IS_DEDI, format ["ASHPD_REFRESH_%1", clientOwner]];