/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.classes.routes.entity;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

/**
 * Matches entities to routes
 *
 * This route will match by entity and map its fields to the URL pattern by
 * comparing the field names with the template vars. This makes it easy and
 * convenient to change routes globally.
 */

class DEntityRoute : DRoute {
    mixin(RouteThis!("Entity"));
}
mixin(RouteCalls!("Entity"));

unittest {
    assert(testRoute(new DEntityRoute));
}