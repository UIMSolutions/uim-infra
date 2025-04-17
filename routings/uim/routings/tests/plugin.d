/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.tests.plugin;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

bool testRoutingPlugin(IRoutingPlugin obj) {
    assert(obj !is null);
    
    return true;
}