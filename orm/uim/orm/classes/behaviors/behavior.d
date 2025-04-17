module uim.orm.classes.behaviors.behavior;

mixin(Version!"test_uim_orm");

import uim.orm;
@safe:

class DORMBehavior : UIMObject, IORMBehavior {
    mixin(ORMBehaviorThis!());
}