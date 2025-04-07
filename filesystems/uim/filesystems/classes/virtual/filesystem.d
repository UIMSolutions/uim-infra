/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.classes.virtual.filesystem;

import uim.filesystems;

unittest {
  version (testUimFilesystems) {
    debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
  }
}

@safe:
class DVirtualFilesystem : DFilesystem {
  mixin(FilesystemThis!("Virtual"));

  override bool initialize(Json[string] initData = null) { // Hook
    if (!super.initialize(initData)) {
      return false;
    }
    _rootFolder = VirtualFolder(this);
    return true;
  }
}

mixin(FilesystemCalls!("Virtual"));
