/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.classes.routes.pluginshort;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:


/*
/**
 * Plugin short route, that copies the plugin param to the controller parameters
 * It is used for supporting /{plugin} routes.
 */
class DPluginShortRoute : DInflectedRoute {
    mixin(RouteThis!("PluginShort"));
}

mixin(RouteCalls!("PluginShort"));

unittest {
    assert(testRoute(new DPluginShortRoute));
}
