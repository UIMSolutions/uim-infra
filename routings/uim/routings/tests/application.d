module uim.routings.tests.application;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

bool testRoutingApplication(IRoutingApplication app) {
    assert(app !is null, "RoutingApplication is null");
    
    return true;
}