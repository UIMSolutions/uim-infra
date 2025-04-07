/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.interfaces.folder;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:

interface IFolder : IFilesystemEntry, IFolderManager, IFileManager, ILinkManager {
  // Sets or returns the attributes of a specified folder.
  long attributes();
  void attributes(long newAttributes);

  // Returns the date and time when a specified folder was created.
  long createdOn();

  // Returns the date and time when a specified folder was last accessed.
  long accessedOn();

  // Returns the date and time when a specified folder was last modified.
  long modifiedOn();

  // Returns the drive letter of the drive where the specified folder resides.
  IDrive drive();

  bool hasEntries();
  bool isEmpty();

  // Returns True if a folder is the root folder and False if not.
  bool isRootFolder();
  bool isFolder();

  // Returns the type of a specified folder. */
  string type();

  // Deletes file.
  bool remove();
}
