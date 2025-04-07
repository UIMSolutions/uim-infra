/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.classes.file;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:

@safe:
class DFile : DFilesystemEntry, IFile {
  mixin(FileThis!());

  override bool initialize(Json[string] initData = null) { // Hook
    if (!super.initialize(initData)) {
      return false;
    }

    return true;
  }

  // #region inherited properties

  // #region Properties
  // Returns the folder object for the parent of the specified file.
  override bool isFile() {
    return exists;
  }

  // Check if file exits
  override bool exists() {
    if (parentFolder)
      return parentFolder.existsFolder(path, name);
    return (hasFilesystem ? filesystem.existsFolder(path, name) : false);
  }

  // Sets or returns the attributes of a specified file.
  size_t attributes() {
    return 0;
  }

  void attributes(size_t newAttributes) {
  }

  // Returns the date and time when a specified file was created.
  long createdOn() {
    return 0;
  }

  // Returns the date and time when a specified file was last accessed.
  long accessedOn() {
    return 0;
  }

  // Returns the date and time when a specified file was last modified.
  long modifiedOn() {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return 0;
  }

  // Returns the drive letter of the drive where a specified file or folder resides.
  string driveName() {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return null;
  }

  // Returns the type of a specified file.
  string type() {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return null;
  }
  // #endregion Properties

  void[] readContent(size_t dataSitze = size_t.max) {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return (hasFilesystem ? filesystem.readFromFile(path, name, dataSitze) : null);
  }

  void writeContent(const void[] content) {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    if (hasFilesystem)
      filesystem.writeToFile(path, name, content);
  }

  void appendContent(const void[] content) {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    if (hasFilesystem)
      filesystem.appendToFile(path, name, content);
  }

  string readText() {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return (hasFilesystem ? filesystem.readTextFromFile(path, name) : null);
  }

  void writeText(string aText) {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    if (hasFilesystem)
      filesystem.writeTextToFile(path, name, aText);
  }

  void appendText(string aText) {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    if (hasFilesystem)
      filesystem.appendTextToFile(path, name, aText);
  }

  string[] readLines() {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return (hasFilesystem ? filesystem.readLines(path, name) : null);
  }

  Json readJson() {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return Json(null);
  }

  bool writeJson(Json jsonData) {
    version (testUimFilesystems) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return false;
  }

  // #region Methods
  // Copies a specified file from one location to another.
  bool copy(string toPath) {
    return false;
  }

  bool copy(string[] toPath) {
    return false;
  }

  bool copy(IFolder toFolder) {
    return false;
  }

  // Moves file from one location to another.
  bool move(string toPath) {
    return false;
  }

  bool move(string[] toPath) {
    return false;
  }

  bool move(IFolder toFolder) {
    return false;
  }

  // Deletes file.
  bool remove() {
    return (hasFilesystem ? filesystem.removeFile(path, name) : false);
  }

  override string toString() {
    return this.classname ~ ": " ~ name;
  }
  // TODO: OpenAsTextStream   Opens a specified file and returns a TextStream object to access the file.
  // #endregion Methods
}

unittest {
  // TODO Adding Tests
}
