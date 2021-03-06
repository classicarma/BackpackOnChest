/*
 * Author: DerZade
 * Returns array with all magazines from chestpack of the given unit.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * chestpack magazines <ARRAY> [classname,ammo count, amount of mags]
 *
 * Example:
 * [player] call zade_boc_fnc_chestpackMagazines;
 *
 * Public: No
 */
params ["_unit"];

if (isNil "_unit") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _var = _unit getVariable ["zade_boc_chestpack",nil];
private _mags = [];

{
     private _mag = +(_x);
     _mag pushBack ((compile format ["_x isEqualTo %1",_x]) count (_var select 3));
     _mags pushBackUnique _mag;
} forEach (_var select 3);

//return objNull
if (isNil "_var" or isNil "_mags") exitWith {[]};

//return magazines
_mags
