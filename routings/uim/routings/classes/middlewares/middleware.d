/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.classes.middlewares.middleware;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

class DRoutingMiddleware : UIMObject, IRoutingMiddleware {
    mixin(RoutingMiddlewareThis!());

    override bool initialize(Json[string] initData = null) {
        if (!super.initialize(initData)) {
            return false;
        }

        return true;
    }
}