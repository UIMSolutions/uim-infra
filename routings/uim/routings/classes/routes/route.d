/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.classes.routes.route;

mixin(Version!"test_uim_routings");

import uim.routings;

@safe:

class DRoute : UIMObject, IRoute {
  mixin(RouteThis!());

  override bool initialize(Json[string] initData = null) {
    if (!super.initialize(initData)) {
      return false;
    }

    _options = (new Json[string]);

    return true;
  }

  // An array of additional parameters for the Route.
  Json[string] _options;

  // Default parameters for a Route
  Json[string] _defaultValues;

  // The routes template string.
  string mytemplate;

  // #region greedy
  // Is this route a greedy route? Greedy routes have a `/*` in their template
  protected bool _greedy = false;
  IRoute greedy(bool value) {
    _greedy = value;
    return this;
  }
  bool greedy() {
    return _greedy;
  }
  unittest {
    assert(testRoute(new DRoute).greedy(true).greedy() == true);
  }
  // #endregion greedy

  // #region compiledRoute
  // The compiled route regular expression
  protected string _compiledRoute = null;
  IRoute compiledRoute(string route) {
    _compiledRoute = route;
    return this;
  }
  string compiledRoute() {
    return _compiledRoute;
  }
  unittest {
    assert(testRoute(new DRoute).compiledRoute("test").compiledRoute() == "test");
  }
  // #endregion compiledRoute

  // #region extensions
  // List of connected extensions for this route.
  protected string[] _extensions = null;
  IRoute extensions(string[] names) {
    _extensions = names;
    return this;
  }

  string[] extensions() {
    return _extensions;
  }

  IRoute addExtensions(string[] names) {
    _extensions ~= names;
    return this;
  }
  unittest {
    assert(testRoute(new DRoute).extensions(["test"]).extensions.length == 1);
    assert(testRoute(new DRoute).addExtensions(["test2"]).extensions.length == 2);
  }
  // #endregion extensions

  /**
     * An array of named segments in a Route.
     * `/{controller}/{action}/{id}` has 3 key elements
     */
  Json[string] _someKeys = null;

  // #region middlewares
  // List of middleware that should be applied.
  protected Json[string] _middlewares = null;
  IRoute middlewares(Json[string] items) {
    _middlewares = items.dup;
    return this;
  }

  Json[string] middlewares() {
    return _middlewares;
  }

  IRoute addMiddlewares(Json[string] items) {
    _middlewares = _middlewares.set(items);
    return this;
  }
  unittest {
    assert(testRoute(new DRoute).middlewares(["test": "test"]).middlewares.length == 1);
    assert(testRoute(new DRoute).addMiddlewares(["test2": "test2"]).middlewares.length == 2);
  }
  // #endregion middleware

  // Valid HTTP methods.
  const string[] HTTP_VALID_METHODS = [
    "GET", "PUT", "POST", "PATCH", "DELETE", "OPTIONS", "HEAD"
  ];
}

unittest {
  assert(testRoute(new DRoute));
}
