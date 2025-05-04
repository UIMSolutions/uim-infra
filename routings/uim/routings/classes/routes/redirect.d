/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.classes.routes.redirect;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

/**
 * Redirect route will perform an immediate redirect. Redirect routes
 * are useful when you want to have Routing layer redirects occur in your
 * application, for when URLs move.
 *
 * Redirection is signalled by an exception that halts route matching and
 * defines the redirect URL and status code.
 */
class DRedirectRoute : DRoute {
    mixin(RouteThis!("Redirect"));

    // The location to redirect to.
    Json[string] _redirect;
}

mixin(RouteCalls!("Redirect"));

unittest {
    assert(testRoute(new DRedirectRoute));
}
