/*********************************************************************************************************
	Copyright: © 2018-2025 Ozan Nurettin Süel (UIManufaktur)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (UIManufaktur)                                                      
**********************************************************************************************************/
module uim.databases.interfaces.dbaexpression;

@safe:
import uim.databases;

// An interface used by Expression objects.
interface IDBAExpression {
    // Converts the Node into a SQL string fragment.
    // TODO string sql(DValueBinder valueBinder);

    /**
     * Iterates over each part of the expression recursively for every
     * level of the expressions tree and executes the callback callable
     * passing as first parameter the instance of the expression currently
     * being iterated.
     */
    // TODO IDBAExpression traverse(DClosure aCallback);
}
