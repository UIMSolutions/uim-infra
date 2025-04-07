/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.jsonbases.classes.bases.base;

import uim.jsonbases;

unittest {
  version (test_uim_jsonbase) {
    debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
  }
}

@safe:
class DJsonBase : UIMObject, IJsonBase, IJsonTenantManager {
  mixin(JsonBaseThis!());
  
  mixin(TProperty!("string", "classname"));

  // #region TenantManager
  // Tenants
  protected IJsonTenant[string] _tenants;

  bool hasTenants(string[] someNames...) {
    return hasTenants(someNames.dup);
  }

  bool hasTenants(string[] someNames = null) {
    return (countTenants(someNames) > 0);
  }

  size_t countTenants(string[] someNames...) {
    return countTenants(someNames.dup);
  }

  size_t countTenants(string[] someNames = null) {
    if (someNames.isEmpty) {
      return _tenants.length;
    }

    return someNames.map!(n => (tenant(n) ? 1 : 0)).sum();
  }

  string[] existingTenants(string[] someNames...) {
    return existingTenants(someNames.dup);
  }

  string[] existingTenants(string[] someNames = null) {
    return someNames.filter!(n => (tenant(n) ? true : false)).array;
  }

  string[] tenantNames() {
    return _tenants.keys;
  }

  IJsonTenant[] tenants() {
    return _tenants.values;
  }

  // Tenant
  bool hasTenant(string aName) {
    return (tenant(aName) !is null);
  }

  IJsonTenant tenant(string aName) {
    return _tenants.get(aName, null);
  }

  // Add tenants
  bool addTenants(IJsonTenant[] someTenants...) {
    return addTenants(someTenants.dup);
  }

  bool addTenants(IJsonTenant[] someTenants) {
    foreach (myTenant; someTenants) {
      if (!addTenant(myTenant)) {
        return false;
      }
    }
    return true;
  }

  bool addTenants(IJsonTenant[string] someTenants) {
    foreach (myName, myTenant; someTenants) {
      if (!addTenant(myName, myTenant)) {
        return false;
      }
    }
    return true;
  }

  // Add tenant
  bool addTenant(IJsonTenant aTenant) {
    version (test_uim_jsonbase) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return (aTenant ? addTenant(aTenant.name, aTenant) : false);
  }

  bool addTenant(string aName, IJsonTenant aTenant) {
    version (test_uim_jsonbase) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    if (aName.isEmpty || aTenant is null) {
      return false;
    }

    _tenants[aName] = aTenant;
    return true;
  }

  // #region CREATE
  IJsonTenant[] createTenants(string[] someNames...) {
    version (test_uim_jsonbase) {
      debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
    }

    return createTenants(someNames.dup);
  }

  IJsonTenant[] createTenants(string[] someNames) {
    return someNames
      .map!(n => createTenant(n))
      .filter!(t => (t ? true : false))
      .array;
  }

  IJsonTenant createTenant(string aName) {
    return null;
  }
  // #endregion CREATE

  // #region DELETE
  bool deleteTenants(string[] someNames...) {
    return deleteTenants(someNames.dup);
  }

  bool deleteTenants(string[] someNames) {
    foreach (myName; someNames) {
      if (!deleteTenant(myName)) {
        return false;
      }
    }

    return true;
  }

  bool deleteTenant(string aName) {
    return false;
  }
  // #endregion DELETE
  // #endregion TenantManager
}

unittest {
  version (test_uim_jsonbase) {
    debug writeln("\n", __MODULE__ ~ ": " ~ __PRETTY_FUNCTION__);
  }
}
