/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.jsonbases.mixins.collection;

import uim.jsonbases;

@safe:

string jsonCollectionThis(string name = null) {
  string fullName = name ~ "JsonCollection";
  return objThis(fullName)
    ~ (name !is null
        ? `
      this(IJsonTenant tenant, Json[string] initData = null) { super(tenant, initData); }
      this(IJsonTenant tenant, string name, Json[string] initData = null) { super(tenant, name, initData); }`
        : "");
}

template JsonCollectionThis(string name = null) {
  const char[] JsonCollectionThis = jsonCollectionThis(name);
}

string jsonCollectionCalls(string name) {
  string fullName = name ~ "JsonCollection";

  return objCalls(fullName) ~
    `auto ` ~ fullName ~ `(IJsonTenant tenant, Json[string] initData = null) { return new D` ~ fullName ~ `(tenant, initData); }
auto `
    ~ fullName ~ `(IJsonTenant tenant, string name, Json[string] initData = null) { return new D` ~ fullName ~ `(tenant, name, initData); }
  `;
}

template JsonCollectionCalls(string name) {
  const char[] JsonCollectionCalls = jsonCollectionCalls(name);
}
