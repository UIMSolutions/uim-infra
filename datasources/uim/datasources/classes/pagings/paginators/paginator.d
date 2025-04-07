/*********************************************************************************************************
	Copyright: © 2018-2025 Ozan Nurettin Süel (UIManufaktur)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (UIManufaktur)                                                      
**********************************************************************************************************/
module uim.datasources.classes.pagings.paginators.paginator;

mixin(Version!"test_uim_datasources");

import uim.datasources;
@safe:

// This class is used to handle automatic model data pagination.
class DPaginator : IDatasourcePaginator {
    mixin TConfigurable;

    this() {
        initialize;
    }

    this(Json[string] initData) {
        initialize(initData);
    }

    this(string name) {
        this().name(name);
    }

    // Hook method
    bool initialize(Json[string] initData = null) {
        configuration(MemoryConfiguration);
        configuration.setEntries(initData);

        /**
        * Default pagination settings.
        *
        * When calling paginate() these settings will be merged with the configuration
        * you provide.
        *
        * - `maxLimit` - The maximum limit users can choose to view. Defaults to 100
        * - `limit` - The initial number of items per page. Defaults to 20.
        * - `page` - The starting page, defaults to 1.
        * - `allowedParameters` - A list of parameters users are allowed to set using request
        *  parameters. Modifying this list will allow users to have more influence
        *  over pagination, be careful with what you permit.
        */
        configuration
            .setEntry("page", 1)
            .setEntry("limit", 20)
            .setEntry("maxLimit", 100)
            .setEntry("allowedParameters", ["limit", "sort", "page", "direction"].toJson);

        return true;
    }

    mixin(TProperty!("string", "name"));

    // Paging params after pagination operation is done.
    protected STRINGAA _pagingParams = null;
}

unittest {
    // TODO Unitest
}
