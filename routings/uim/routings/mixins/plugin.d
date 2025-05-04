/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.mixins.plugin;

import uim.routings;
@safe: 

string routingPluginThis(string name = null) {
    string fullName = name ~ "RoutingPlugin";
    return objThis(fullName);
}

template RoutingPluginThis(string name = null) {
    const char[] RoutingPluginThis = routingPluginThis(name);
}

string routingPluginCalls(string name) {
    string fullName = name ~ "RoutingPlugin";
    return objCalls(fullName);
}

template RoutingPluginCalls(string name) {
    const char[] RoutingPluginCalls = routingPluginCalls(name);
}
