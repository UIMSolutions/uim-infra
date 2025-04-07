/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.classes.link;

import uim.filesystems;

unittest {
  version (testUimFilesystems) {
    debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
  }
}

@safe:
class DLink : DFilesystemEntry, ILink {
  mixin(FolderThis!("Link"));

  override bool initialize(Json[string] initData = null) { // Hook
    if (!super.initialize(initData)) {
      return false;
    }
    return true;
  }

  override bool isLink() {
    return exists;
  }

  bool isFileLink() {
    return false;
  }

  bool isFolderLink() {
    return false;
  }

  override bool exists() {
    return (hasFilesystem ? filesystem.existsLink(name) : false);
  }

  override string toString() {
    return this.classname ~ ": " ~ name;
  }
}

// mixin(FolderCalls!("Link"));

unittest {
  // assert(Link, "Could not create LInk");
}
