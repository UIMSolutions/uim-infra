/*********************************************************************************************************
	Copyright: © 2018-2025 Ozan Nurettin Süel (UIManufaktur)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (UIManufaktur)                                                      
**********************************************************************************************************/
module uim.datasources.exceptions.invalidprimarykey;

import uim.datasources;

@safe:
// Exception raised when the provided primary key does not match the table primary key
class DDSOInvalidPrimaryKeyException : DDatasourcesException {
	mixin(ExceptionThis!("DSOInvalidPrimaryKey"));

    override bool initialize(Json[string] initData = null) {
		if (!super.initialize(initData)) { return false; }
		
		this
			.messageTemplate("Primary Key is invalid.");

		return true;
	}
}
mixin(ExceptionCalls!("DSOInvalidPrimaryKey"));
