module uim.routings.tests.plugin;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

bool testRoutingPlugin(IRoutingPlugin obj) {
    assert(obj !is null);
    
    return true;
}