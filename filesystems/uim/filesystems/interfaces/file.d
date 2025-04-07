/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.interfaces.file;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:

interface IFile : IFilesystemEntry {
  // #region Properties
  // Sets or returns the attributes of a specified file.
  bool isFile();

  size_t attributes();
  void attributes(size_t newAttributes);

  // Returns the date and time when a specified file was created.
  long createdOn();

  // Returns the date and time when a specified file was last accessed.
  long accessedOn();

  // Returns the date and time when a specified file was last modified.
  long modifiedOn();

  // Returns the drive letter of the drive where a specified file or folder resides.
  string driveName();

  // Returns the type of a specified file.
  string type();
  // #endregion Properties

  // #region Methods
  void writeContent(const void[] content);
  void[] readContent(size_t contentSize = size_t.max);
  void appendContent(const void[] content);

  string readText();
  void writeText(string aText);
  void appendText(string aText);

  string[] readLines();

  Json readJson();
  bool writeJson(Json jsonData);

  // Copies a specified file from one location to another.
  bool copy(string toPath);
  bool copy(string[] toPath);
  bool copy(IFolder toFolder);

  // Moves file from one location to another.
  bool move(string toPath);
  bool move(string[] toPath);
  bool move(IFolder toFolder);

  // Deletes file.
  bool remove();

  // TODO: OpenAsTextStream   Opens a specified file and returns a TextStream object to access the file.
  // #endregion Methods
}
