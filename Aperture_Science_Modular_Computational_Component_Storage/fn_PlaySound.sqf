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

#ifdef ASHPD_DEBUG
ASHPD_LOG_FUNC("PlaySound");
#endif

/// Description: Wrapper function for PlaySound3D.
/// Parameters:
///		PARAMETER		|		EXPECTED INPUT TYPE		|		DESCRIPTION
///
///		Object			|		Object					|		The source of the sound.
///		Sound			|		String					|		The CfgSounds class of the sound.
///
///	Return value: None.

params[["_object", objNull, [objNull]], ["_sound", "", [""]]]; 
getArray(configFile >> "CfgSounds" >> _sound >> "sound") params ["_path", "_volume", ["_pitch", 1], ["_distance", 0]];
playSound3D [_path, _object, false, getPosASL _object, _volume, _pitch, _distance];