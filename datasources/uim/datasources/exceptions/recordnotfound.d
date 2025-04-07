/*********************************************************************************************************
	Copyright: © 2018-2025 Ozan Nurettin Süel (UIManufaktur)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (UIManufaktur)                                                      
**********************************************************************************************************/
module uim.datasources.exceptions.recordnotfound;

mixin(Version!"test_uim_datasources");

import uim.datasources;
@safe:

// Exception raised when a particular record was not found
class DRecordNotFoundException : DDatasourcesException {
	mixin(ExceptionThis!("RecordNotFound"));

    override bool initialize(Json[string] initData = null) {
		if (!super.initialize(initData)) { return false; }
		
		this
			.messageTemplate("Record not found.");

		return true;
	}
}
mixin(ExceptionCalls!("RecordNotFound"));
