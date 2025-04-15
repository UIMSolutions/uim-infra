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