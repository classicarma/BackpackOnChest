/*
 * Author: DerZade
 * Returns array with all items (of any kind, even weapons) in chestpack of the given unit.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: Return magazines aswell <BOOL> (optional | default: true)
 *
 * Return Value:
 * Items <ARRAY>
 *
 * Example:
 * [player] call zade_boc_fnc_chestpackItems;
 *
 * Public: No
 */
params ["_unit",["_returnMags",true]];

if (isNil "_unit") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _var = _unit getVariable ["zade_boc_chestpack",nil];
private _items = +(_var select 2);

if (_returnMags) then {
     //add magazines
     {
          _items pushBack (_x select 0);
     } forEach (_var select 3);
};

//return objNull
if (isNil "_var" or isNil "_items") exitWith {[]};

//return items
_items
