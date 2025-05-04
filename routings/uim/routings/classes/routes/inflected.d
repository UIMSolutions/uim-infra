/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.classes.routes.inflected;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

/**
 * This route class will transparently inflect the controller and plugin routing
 * parameters, so that requesting `/_controller` is parsed as `["controller": "MyController"]`
 */
class DInflectedRoute : DRoute {
  mixin(RouteThis!("Inflected"));

  /**
     * Flag for tracking whether the defaults have been inflected.
     *
     * Default values need to be inflected so that they match the inflections that match()
     * will create.
     */
  protected Json[string] _inflectedDefaults = null;
}
mixin(RouteCalls!("Inflected"));

unittest {
    assert(testRoute(new DInflectedRoute));
}