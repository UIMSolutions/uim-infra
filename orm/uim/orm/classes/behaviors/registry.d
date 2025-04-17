/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.orm.classes.behaviors.registration;

mixin(Version!"test_uim_orm");

import uim.orm;
@safe:

/**
 * BehaviorRegistry is used as a registry for loaded behaviors and handles loading
 * and constructing behavior objects.
 */
class DORMBehaviorRegistry : DObjectRegistry!DORMBehavior {
    // The table using this registry.
    protected DORMTable _table;
}

auto ORMBehaviorRegistry() {
    return DORMBehaviorRegistry.registration();
}
