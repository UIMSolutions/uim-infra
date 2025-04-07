/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.tests.file;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:

// #region Files Tests
  void testFile_CreateFiles(string moduleName, IFilesystem fs, string strPath, string[] arrPath) {
    version(testUimFilesystems) { 
      debug writeln("Running test 'testFile_CreateFiles'..."); 
      debug writeln("ModuleName = ", moduleName, "\t strPath   = ", strPath, "\t arrPath = ", arrPath);
    }
  }

  void testFile_ReadFiles(string moduleName, IFilesystem fs, string strPath, string[] arrPath) {
    version(testUimFilesystems) { 
      debug writeln("Running test 'testFile_ReadFiles'..."); 
      debug writeln("ModuleName = ", moduleName, "\t strPath   = ", strPath, "\t arrPath = ", arrPath);
    }
  }

  void testFile_UpdateFiles(string moduleName, IFilesystem fs, string strPath, string[] arrPath) {
    version(testUimFilesystems) { 
      debug writeln("Running test 'testFile_UpdateFiles'..."); 
      debug writeln("ModuleName = ", moduleName, "\t strPath   = ", strPath, "\t arrPath = ", arrPath);
    }
  }

  void testFile_RemoveFiles(string moduleName, IFilesystem fs, string strPath, string[] arrPath) {
    version(testUimFilesystems) { 
      debug writeln("Running test 'testFile_RemoveFiles'..."); 
      debug writeln("ModuleName = ", moduleName, "\t strPath   = ", strPath, "\t arrPath = ", arrPath);
    }
  }
// #endregion Files Tests

// #region File Tests
  void testFile_CreateFile(string moduleName, IFilesystem fs, string strPath, string[] arrPath) {
    version(testUimFilesystems) { 
      debug writeln("Running test 'testFile_CreateFile'..."); 
      debug writeln("ModuleName = ", moduleName, "\t strPath   = ", strPath, "\t arrPath = ", arrPath);
    }
  }

  void testFile_ReadFile(string moduleName, IFilesystem fs, string strPath, string[] arrPath) {
    version(testUimFilesystems) { 
      debug writeln("Running test 'testFile_ReadFile'..."); 
      debug writeln("ModuleName = ", moduleName, "\t strPath   = ", strPath, "\t arrPath = ", arrPath);
    }
  }

  void testFile_UpdateFile(string moduleName, IFilesystem fs, string strPath, string[] arrPath) {
    version(testUimFilesystems) { 
      debug writeln("Running test 'testFile_UpdateFile'..."); 
      debug writeln("ModuleName = ", moduleName, "\t strPath   = ", strPath, "\t arrPath = ", arrPath);
    }
  }

  void testFile_RemoveFile(string moduleName, IFilesystem fs, string strPath, string[] arrPath) {
    version(testUimFilesystems) { 
      debug writeln("Running test 'testFile_RemoveFile'..."); 
      debug writeln("ModuleName = ", moduleName, "\t strPath   = ", strPath, "\t arrPath = ", arrPath);
    }
  }
// #endregion File Tests
