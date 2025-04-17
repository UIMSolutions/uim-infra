module uim.orm.classes.associations.association;

mixin(Version!"test_uim_orm");

import uim.orm;
@safe:


class DORMAssociation : UIMObject, IORMAssociation {
    mixin(ORMAssociationThis!());
}