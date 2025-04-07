/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.interfaces.filemanager;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:

interface IFileManager {
  bool hasFiles(string aPathOrName);
  bool hasFiles(string aPath, string aFileName);
  bool hasFiles(string[] aPath);
  bool hasFiles(string[] aPath, string aFileName);

  size_t countFiles(string aPathOrName);
  size_t countFiles(string aPath, string aFileName);
  size_t countFiles(string[] aPath);
  size_t countFiles(string[] aPath, string aFileName);

  IFile[] files();
  IFile[] files(string aPathOrName);
  IFile[] files(string aPath, string aFileName);
  IFile[] files(string[] aPath);
  IFile[] files(string[] aPath, string aFileName);

  // Returns a File object for a specified path.
  IFile file(string aPathOrName);
  IFile file(string aPath, string aFileName);
  IFile file(string[] aPath);
  IFile file(string[] aPath, string aFileName);

  bool existsFile(string aPathOrName);
  bool existsFile(string aPath, string aFileName);
  bool existsFile(string[] aPath);
  bool existsFile(string[] aPath, string aFileName);

  bool addFile(IFile aFile);

  IFile createFile(string aPathOrName);
  IFile createFile(string aPath, string aFileName);
  IFile createFile(string[] aPath);
  IFile createFile(string[] aPath, string aFileName);

  bool renameFile(string oldPathAndName, string newName);
  bool renameFile(string aPath, string oldName, string newName);
  bool renameFile(string[] oldPathAndName, string newName);
  bool renameFile(string[] aPath, string oldName, string newName);

  // Copies file from one location to another.
  bool copyFile(string fromPath, string toPath);
  bool copyFile(string[] fromPath, string[] toPath);

  // Moves one or more files from one location to another.
  bool moveFile(string fromPath, string toPath);
  bool moveFile(string[] fromPath, string[] toPath);

  // Checks if a specified file exists. False, ifsomeFiles is empty
  final bool filesExists(IFile[] files) {
    if (files.isEmpty) { return false; }

    return files.all!(file => file.exists);
  }

  bool removeFile(string aPath);
  bool removeFile(string aPath, string aFolderName);
  bool removeFile(string[] aPath);
  bool removeFile(string[] aPath, string aFolderName);
}