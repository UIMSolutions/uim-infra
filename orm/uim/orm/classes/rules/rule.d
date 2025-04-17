module uim.orm.classes.rules.rule;

mixin(Version!"test_uim_orm");

import uim.orm;
@safe:

class DORMRule : UIMObject, IORMRule {
    mixin(ORMRuleThis!());
}