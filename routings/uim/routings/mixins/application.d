/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.mixins.application;

import uim.routings;
@safe: 

string routingApplicationThis(string name = null) {
    string fullName = name ~ "RoutingApplication";
    return objThis(fullName);
}

template RoutingApplicationThis(string name = null) {
    const char[] RoutingApplicationThis = routingApplicationThis(name);
}

string routingApplicationCalls(string name) {
    string fullName = name ~ "RoutingApplication";
    return objCalls(fullName);
}

template RoutingApplicationCalls(string name) {
    const char[] RoutingApplicationCalls = routingApplicationCalls(name);
}
