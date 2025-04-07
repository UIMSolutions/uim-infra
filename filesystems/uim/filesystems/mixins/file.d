/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.mixins.file;

import uim.filesystems;

@safe:
string fileThis(string name = null) {
  string fullName = name ~ "File";
  return objThis(fullName)
    ~
    (name !is null
        ? `this(string[] path, Json[string] initData = null) {
        this(initData); this.path(path);
      }
      this(IFilesystem filesystem, Json[string] initData = null) {
          this(initData); this.filesystem(filesystem);
      }
      this(IFilesystem filesystem, string name, Json[string] initData = null) {
          this(name, initData); this.filesystem(filesystem);
      }
      this(IFilesystem filesystem, string[] path, Json[string] initData = null) {
          this(name, initData); this.filesystem(filesystem);
      }` : ``);
}

template FileThis(string name = null) {
  const char[] FileThis = fileThis(name);
}

string fileCalls(string name) {
  string fullName = name ~ "File";
  return objCalls(fullName) ~
    `
auto `
    ~ fullName ~ `(string[] path, Json[string] initData = null) { return new D` ~ fullName ~ `(path, initData); };

auto `
    ~ fullName ~ `(IFilesystem filesystem, Json[string] initData = null) { return new D` ~ fullName ~ `(filesystem, initData); };
auto `
    ~ fullName ~ `(IFilesystem filesystem, string name, Json[string] initData = null) { return new D` ~ fullName ~ `(filesystem, name, initData); };
auto `
    ~ fullName ~ `(IFilesystem filesystem, string[] path, Json[string] initData = null) { return new D` ~ fullName ~ `(filesystem, path, initData); };
  `;
}

template FileCalls(string shortName) {
  const char[] FileCalls = fileCalls(shortName);
}
