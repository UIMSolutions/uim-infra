module uim.routings.tests.middleware;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

bool testRoutingMiddleware(IRoutingMiddleware obj) {
    assert(obj !is null);
    
    return true;
}