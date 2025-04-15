/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.jsonbases.helpers.folder;

mixin(Version!"test_uim_jsonbases");

import uim.jsonbases;
@safe:

bool folderhasKey(IFolder aFolder) {
  return (aFolder !is null && aFolder.exists);
}

bool subfolderhasKey(IFolder aFolder, string aName) {
  return folderhasKey(aFolder)
    ? aFolder.folder(aName) !is null
    : false;
}