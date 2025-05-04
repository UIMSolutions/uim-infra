/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.mixins.middleware;

import uim.routings;
@safe: 

string routingMiddlewareThis(string name = null) {
    string fullName = name ~ "RoutingMiddleware";
    return objThis(fullName);
}

template RoutingMiddlewareThis(string name = null) {
    const char[] RoutingMiddlewareThis = routingMiddlewareThis(name);
}

string routingMiddlewareCalls(string name) {
    string fullName = name ~ "RoutingMiddleware";
    return objCalls(fullName);
}

template RoutingMiddlewareCalls(string name) {
    const char[] RoutingMiddlewareCalls = routingMiddlewareCalls(name);
}
