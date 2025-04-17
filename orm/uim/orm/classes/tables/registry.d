/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.orm.classes.tables.registration;

mixin(Version!"test_uim_orm");

import uim.orm;
@safe:

// Provides a registry/factory for Table objects.
class DORMTableRegistry : DObjectRegistry!DORMTable {
}
auto ORMTableRegistry() { 
    return DORMTableRegistry.registration;
}