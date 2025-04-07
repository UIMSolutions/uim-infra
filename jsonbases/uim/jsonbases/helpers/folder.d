/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.jsonbases.helpers.folder;

import uim.jsonbases;

unittest { 
  version(test_uim_jsonbase) { 
    debug writeln("\n", __MODULE__~": "~__PRETTY_FUNCTION__); 
  }
}

@safe:
bool folderhasKey(IFolder aFolder) {
  return (aFolder !is null && aFolder.exists);
}

bool subfolderhasKey(IFolder aFolder, string aName) {
  return folderhasKey(aFolder)
    ? aFolder.folder(aName) !is null
    : false;
}