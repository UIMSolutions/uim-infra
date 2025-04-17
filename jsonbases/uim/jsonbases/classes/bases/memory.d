/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.jsonbases.classes.bases.memory;

mixin(Version!"test_uim_jsonbase");

import uim.jsonbases;
@safe:

class DMemoryJsonBase : DJsonBase {
  mixin(JsonBaseThis!("Memory"));

  // Create
  override IJsonTenant createTenant(string aName) {
    addTenant(aName, MemoryJsonTenant(aName));
    return tenant(aName);
  }
}
mixin(JsonBaseCalls!("Memory"));

unittest {
    debug writeln("\n", __MODULE__~": "~__PRETTY_FUNCTION__); 
}