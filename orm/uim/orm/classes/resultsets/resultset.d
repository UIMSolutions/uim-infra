module uim.orm.classes.resultsets.resultset;

mixin(Version!"test_uim_orm");

import uim.orm;
@safe:

class DORMResultset : UIMObject, IORMResultset {
    mixin(ORMResultsetThis!());
}