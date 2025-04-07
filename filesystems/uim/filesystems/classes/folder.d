/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.classes.folder;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:


class DFolder : DFilesystemEntry, IFolder, IFolderManager, IFileManager, ILinkManager {
  mixin(FolderThis!());

  override bool initialize(Json[string] initData = null) { // Hook
    if (!super.initialize(initData)) {
      return false;
    }
    return true;
  }

  protected string _pathSeparator;
  void pathSeparator(string newSeparator) {
    _pathSeparator = newSeparator;
  }

  string pathSeparator() {
    return (hasFilesystem ? filesystem.pathSeparator : null);
  }

  override bool exists() {
    return (hasFilesystem ? filesystem.existsFolder(path, name) : false);
  }

  override bool isFolder() {
    return exists;
  }

  // Sets or returns the attributes of a specified folder.
  long attributes() {
    // TODO
    return 0;
  }

  void attributes(long newAttributes) {
    // TODO
  }

  // Returns the date and time when a specified folder was created.
  long createdOn() {
    // TODO
    return 0;
  }

  // Returns the date and time when a specified folder was last accessed.
  long accessedOn() {
    // TODO
    return 0;
  }
  // Returns the date and time when a specified folder was last modified.
  long modifiedOn() {
    // TODO
    return 0;
  }
  // Returns the drive letter of the drive where the specified folder resides.
  IDrive drive() {
    // TODO
    return null;
  }

  bool hasEntries() {
    // TODO
    return false;
  }

  bool isEmpty() {
    // TODO
    return true;
  }

  // Returns True if a folder is the root folder and False if not.
  bool isRootFolder() {
    // TODO
    return false;
  }

  // Returns the type of a specified folder. */
  string type() {
    // TODO
    return null;
  }

  // #region Methods
  // Deletes file.
  bool remove() {
    return false;
  }
  // #endregion Methods

  mixin TFolderManager!();
  mixin TFileManager!();
  mixin TLinkManager!();

  override string toString() {
    return this.classname ~ ": " ~ name;
  }

  override Json[string] debugInfo(string[] showKeys = null, string[] hideKeys = null) {
    return super.debugInfo(showKeys, hideKeys);
  }

}
// mixin(FolderCalls!("Folder"));

unittest {
  // assert(Folder(), "Could not create file object");
}
