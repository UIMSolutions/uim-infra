/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.mixins.filesystem;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:

string filesystemThis(string name = null) {
  string fullName = name ~ "Filesystem";
  string mainPart = objThis(fullName);

  if (name !is null) {
    mainPart ~= `this(string[] path, Json[string] initData = null) { super(path, initData); }`;
  }
  return mainPart;
}

template FilesystemThis(string name = null) {
  const char[] FilesystemThis = filesystemThis(name);
}

string filesystemCalls(string name) {
  string fullName = name ~ "Filesystem";

  return `
auto `
    ~ fullName ~ `() { return new D` ~ fullName ~ `; }
auto `
    ~ fullName ~ `(Json[string] initData) { return new D` ~ fullName ~ `(initData); };
auto `
    ~ fullName ~ `(string name, Json[string] initData = null) { return new D` ~ fullName ~ `(name, initData); };
auto `
    ~ fullName ~ `(string[] path, Json[string] initData = null) { return new D` ~ fullName ~ `(path, initData); };
  `;
}

template FilesystemCalls(string name) {
  const char[] FilesystemCalls = filesystemCalls(name);
}
