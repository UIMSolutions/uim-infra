/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.orm.classes.rules.rule;

mixin(Version!"test_uim_orm");

import uim.orm;
@safe:

class DORMRule : UIMObject, IORMRule {
    mixin(ORMRuleThis!());
}