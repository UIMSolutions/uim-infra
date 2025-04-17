module uim.routings.tests.route;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

bool testRoute(IRoute obj) {
    assert(obj !is null);
    
    return true;
}