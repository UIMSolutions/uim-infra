/*********************************************************************************************************
	Copyright: © 2018-2025 Ozan Nurettin Süel (UIManufaktur)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (UIManufaktur)                                                      
**********************************************************************************************************/
module uim.datasources.interfaces.connection;

mixin(Version!"test_uim_datasources");

import uim.datasources;
@safe:

    // This interface defines the methods you can depend on in a connection
interface IDatasourceConnection : IObject { // : ILoggerAware
  // Gets the driver instance.
  // object getDriver(string role = ROLE_WRITE);

  // Get / Set a cacher
  // mixin(IProperty!("ICache", "cacher"));

  // Get the configuration name for this connection.
  /*
  string configName();

  // Enable/disable query logging
  void enableQueryLogging(bool shouldEnable = true);

  // Disable query logging
  void disableQueryLogging();

  // Check if query logging is enabled.
  bool isQueryLoggingEnabled();
/*

  // Get the configuration data used to create the connection
  Json[string] configuration.data();

  // Gets the current logger object 
  // ILogger getLogger();


  /**
     * Executes a callable function inside a transaction, if any exception occurs
     * while executing the passed callable, the transaction will be rolled back
     * If the result of the callable bool is `false`, the transaction will
     * also be rolled back. Otherwise, the transaction is committed after executing
     * the callback.
     *
     * The callback will receive the connection instance as its first argument.
     *
     * ### Example:
     *
     * ```
     * connection.transactional(function (connection) {
     *  connection.newQuery().removeKey("users").execute();
     * });
     * ```
     * /
  Json[string] transactional(callable executeWithinTransaction);

  /**
     * Run an operation with constraints disabled.
     *
     * Constraints should be re-enabled after the callback succeeds/fails.
     *
     * ### Example:
     *
     * ```
     * connection.disableConstraints(function (connection) {
     *  connection.newQuery().removeKey("users").execute();
     * });
     * ```
     * /
  Json[string] disableConstraints(callable callback);
  */
}