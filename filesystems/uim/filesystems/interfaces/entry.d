/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.interfaces.entry;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:

interface IFilesystemEntry : IObject {
  bool hasFilesystem();
  IFilesystem filesystem();

  // Sets or returns the path of a specified entry.
  string[] path();
  void path(string[] aPath);

  // Returns the folder object for the parent of the specified file.
  IFolder parentFolder();
  void parentFolder(IFolder aFolder);

  // Name of class

  // Returns the size of a specified folder.
  size_t size();

  // Rename entry
  bool rename(string newName);

  // Check if filesystem exists
   bool exists(); 

  // Check if filesystem entry is hidden
  bool isHidden();

  // Check if filesystem entry is folder
  bool isFolder();

  // Check if filesystem entry is file
  bool isFile();

  // Check if filesystem entry is link
  bool isLink();

  string relPath(string aPath); 
  string relPath(string[] aPath = null); 

  string absolutePath(string aPath); 
  string absolutePath(string[] aPath = null); 

  string toString();
}