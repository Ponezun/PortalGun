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

#ifdef PG_DEBUG
PG_LOG_FUNC("FixArsenalBug");
#endif

uiSleep 0.5; // Need this sleep here for some reason, otherwise PiP cameras remain black
[PG_VAR_BLUE_PORTAL, PG_VAR_ORANGE_PORTAL] remoteExecCall ["PG_fnc_RefreshPiP"];