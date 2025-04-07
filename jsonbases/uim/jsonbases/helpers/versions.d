/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.jsonbases.helpers.versions;

import uim.jsonbases;

version(test_uim_jsonbase) { 
  unittest {
    debug writeln("\n", __MODULE__~": "~__PRETTY_FUNCTION__); 
  }
}

@safe:
// #region check
  bool checkVersion(Json aVersion, string[] keys = null) {
    if (aVersion.isEmpty) { 
      return false; 
    }

    return aVersion.hasAllKeys(keys); 
  }

  bool checkVersion(Json value, UUID id, size_t vNumber = 0) {
    if (!checkVersion(value, ["id", "versionNumber"])) { 
      return false; 
    } // Testing against null results in false

     return vNumber == 0
      ? (value["id"].get!string == id.toString)
      : (value["id"].get!string == id.toString) && (value["versionNumber"].get!size_t == vNumber);
  }

  bool checkVersion(Json aVersion, string[string] selector) {
    // IN Check
    if (!checkVersion(aVersion)) { 
      return false; 
    } // Testing against null results in false
    
    if (selector.isEmpty) { 
      return false; 
    } // Testing against null results in false

    // Body
    if (!aVersion.hasAllKeys(selector.keys)) { 
      return false; 
    }

    foreach (key; selector.byKey) {      
      // debug writeln("-> %s : %s".format(value[key].type, value[key]));
      auto strValue = aVersion[key].isString 
        ? aVersion[key].get!string 
        : aVersion[key].toString;
      
      if (strValue != selector[key]) { 
        return false; 
      }
    }
    return true;
  }
  /// 
  unittest {
    auto json = parseJsonString(`{"a": "b", "c": {"d": 1}, "e": ["f", {"g": "h"}], "i": 1}`);
    /*   assert(checkVersion(json, ["a": "b"]), 
        "Wrong CheckVersion result. Should be true -> %s for %s using %s".format(checkVersion(json, ["a": "b"]), json, ["a": "b"])); */

    assert(checkVersion(json, ["a": "b", "i": "1"]));
    assert(!checkVersion(json, ["a": "y"]));
    assert(!checkVersion(json, ["x": "y"]));
  }

  bool checkVersion(Json aVersion, Json selector) {
    // IN Check
    if (aVersion.isEmpty || selector.isEmpty) { 
      return false; 
    } 

    if (!aVersion.hasAllKeys(selector.keys)) { 
      return false; 
    }
    
    // Body
    return selector.byKeyValue.all!(kv => aVersion[kv.key] == selector[kv.key]);
  }
  unittest {
    auto json = parseJsonString(`{"a": "b", "c": {"d": 1}, "e": ["f", {"g": "h"}], "i": 1}`);
    assert(checkVersion(json, parseJsonString(`{"a": "b"}`)));
    assert(checkVersion(json, parseJsonString(`{"a": "b", "c": {"d": 1}}`)));
    assert(!checkVersion(json, parseJsonString(`{"a": "y"}`)));
    assert(!checkVersion(json, parseJsonString(`{"x": "y"}`)));
  }

  bool checkVersion(T)(Json entity, string key, T value) {
    return (key in entity) && (entity[key].get!T == value);
  }
// #endregion check


import uim.jsonbases;

@safe:
// #endregion lastVersion()
Json lastVersion(Json[] jsons) {
  // Preconditions
  if (jsons.isEmpty) { return Json(null); }

  // Body
  Json result = Json(null);
  jsons
    .filter!(j => "versionNumber" in j)
    .each!(j => result = result.isEmpty ? j : result); 

  if (result.isEmpty) { return Json(null); }

  jsons
    .filter!(j => "versionNumber" in j)
    .each!(j => j["versionNumber"].get!size_t > result["versionNumber"].get!size_t ? j : result); 

  // Final
  return result;
}

Json lastVersion(Json[size_t] jsons) {
  // Preconditions
  if (jsons.length == 0) { return Json(null); }

  // Body
  Json result = Json(null);

  jsons.values
    .filter!(j => "versionNumber" in j) 
    .each!(j => result.length == 0 ? j : result); 

  if (result.isEmpty) { return Json(null); }

  jsons.values
    .filter!(j => "versionNumber" in j)
    .each!(j => j["versionNumber"].get!size_t > result["versionNumber"].get!size_t ? j : result); 

  // Final  
  return result;
}

Json oneVersion(Json[] jsons) {
  // Preconditions
  if (jsons.isEmpty) { return Json(null); }

  // Body
  Json result = Json(null);
  jsons
    .filter!(j => "versionNumber" in j) 
    .each!(j => result.isEmpty ? j : result); 

  if (result.isEmpty) { return Json(null); } 
  
  jsons
    .filter!(j => "versionNumber" in j)
    .each!(j => j["versionNumber"].get!size_t > result["versionNumber"].get!size_t ? j : result); 

  // Final
  return result;
}

Json oneVersion(Json[size_t] jsons) {
  // Preconditions
  if (jsons.length == 0) { return Json(null); }

  // Body
  Json result = Json(null);
  jsons.values
    .filter!(j => "versionNumber" in j) 
    .each!(j => result.isEmpty ? j : result); 

  if (result.isEmpty) { return Json(null); } 
  
  jsons.values
    .filter!(j => "versionNumber" in j)
    .each!(j => j["versionNumber"].get!size_t > result["versionNumber"].get!size_t ? j : result); 
  
  return result;
}

string versionPath(Json json, string sep = "/", string extension = ".json") {
  if (json.isEmpty) return null;
 
  if ("id" in json && "versionNumber" in json) return json["id"].get!string~sep~"1"~extension;

  return ("id" in json) ? 
    json["id"].get!string~sep~to!string(json["versionNumber"].get!size_t)~".json" : "";
}

/* string jsonversionPath(Json json, string sep = "/") {
  if (json.isEmpty) return null;
 
  if ("id" in json && "versionNumber" in json) return json["id"].get!string~sep~"1.json";

  return ("id" in json) ? 
    json["id"].get!string~sep~to!string(json["versionNumber"].get!size_t)~".json" : "";
} */

/* string jsonversionPath(string startPath, Json json, string sep = "/") {
  if (json.isEmpty) return null;
  return startPath~sep~jsonversionPath(json, sep);
} */

