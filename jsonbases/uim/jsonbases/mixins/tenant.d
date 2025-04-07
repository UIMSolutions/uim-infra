/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.jsonbases.mixins.tenant;

import uim.jsonbases;

@safe:
string jsonTenantThis(string name = null) {
  string fullName = name ~ "JsonTenant";
  return objThis(fullName)
    ~ (name !is null
        ? `
        this(IJsonBase base, Json[string] initData = null) { super(base, initData); }
        this(IJsonBase base, string name, Json[string] initData = null) { super(base, name, initData); }`
        : ``);
}

template JsonTenantThis(string name = null) {
  const char[] JsonTenantThis = jsonTenantThis(name);
}

string jsonTenantCalls(string name) {
  string fullName = name ~ "JsonTenant";
  return objCalls(fullName) ~
    `auto ` ~ fullName ~ `(IJsonBase base, Json[string] initData = null) { return new D` ~ fullName ~ `(base, initData); }
auto `
    ~ fullName ~ `(IJsonBase base, string name, Json[string] initData = null) { return new D` ~ fullName ~ `(base, name,initData); }
  `;
}

template JsonTenantCalls(string name) {
  const char[] JsonTenantCalls = jsonTenantCalls(name);
}
