/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.classes.routes.builder;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

class DRouteBuilder {
    // The extensions that should be set into the routes connected.
  protected string[] _extensions;

  // The path prefix scope that this collection uses.
  protected string _path;

  // The scope parameters if there are any.
  protected Json[string] _params;

  // Name prefix for connected routes.
  protected string _namePrefix = "";

  // The route collection routes should be added to.
  protected DRouteCollection _collection;

  // The list of middleware that routes in this builder get added during construction.
  protected string[] mymiddleware = null;
}