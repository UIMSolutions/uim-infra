/****************************************************************************************************************
* Copyright: © 2017-2024 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.routings.classes.router;

import uim.routings;

@safe:

/**
 * Parses the request URL into controller, action, and parameters. Uses the connected routes
 * to match the incoming URL string to parameters that will allow the request to be dispatched. Also
 * handles converting parameter lists into URL strings, using the connected routes. Routing allows you to decouple
 * the way the world interacts with your application (URLs) and the implementation (controllers and actions).
 *
 * ### Connecting routes
 *
 * Connecting routes is done using Router.connect(). When parsing incoming requests or reverse matching
 * parameters, routes are enumerated in the order they were connected. For more information on routes and
 * how to connect them see Router.connect().
 */
class DRouter {
  // Default route class.
  // TODO protected static string _defaultRouteClass = (new DRoute).classname;

  /**
     * Contains the base string that will be applied to all generated URLs
     * For example `https://example.com`
     */
  protected static string _fullBaseUrl = null;

  // Regular expression for action names
  const string ACTION = "index|show|add|create|edit|update|remove|del|delete|view|item";

  // Regular expression for years
  const string YEAR = "[12][0-9]{3}";

  // Regular expression for months
  const string MONTH = "0[1-9]|1[012]";

  // Regular expression for days
  const string DAY = "0[1-9]|[12][0-9]|3[01]";

  // Regular expression for auto increment IDs
  const string ID = "[0-9]+";

  // Regular expression for UUIDs
  const string UUID = "[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}";

  // The route collection routes would be added to.
  protected static DRouteCollection _routeCollection;

  // A hash of request context data.
  protected static Json[string] _serverRequestContext = null;

  // Maintains the request object reference.
  protected static IServerRequest _serverRequest = null;
  // Get the current request object.
  static IServerRequest getRequest() {
    return _serverRequest;
  }

  // Default extensions defined with Router.extensions()
  protected static string[] _defaultExtensions = null;

  // Cache of parsed route paths
  protected static Json[string] _routePaths = null;

  /*
    // Named expressions
    protected static STRINGAA _namedExpressions = [
        "Action": Router.ACTION,
        "Year": Router.YEAR,
        "Month": Router.MONTH,
        "Day": Router.DAY,
        "ID": Router.ID,
        "UUID": Router.UUID,
    ];


    /**
     * Initial state is populated the first time reload() is called which is at the bottom
     * of this file. This is a cheat as get_class_vars() returns the value of static vars even if they
     * have changed.
     */
  protected static Json[string] _initialState = null;

  /**
     * The stack of URL filters to apply against routing URLs before passing the
     * parameters to the route collection.
     */
  protected static IClosure[] _urlFilters = null;

  // Get or set default route class.
  static string defaultRouteClass(string routeclassname = null) {
    /* if (routeclassname.isNull) {
      return _defaultRouteClass;
    }
    _defaultRouteClass = routeclassname; */

    return null;
  }

  // Gets the named route patterns for use in config/routes.d
  static STRINGAA getNamedExpressions() {
    // return _namedExpressions;
    return null;
  }

  /**
     * Get the routing parameters for the request is possible.
     * Params:
     * \UIM\Http\ServerRequest myrequest The request to parse request data from.
     */
  static Json[string] parseRequest(IServerRequest myrequest) {
    // return _routeCollection.parseRequest(myrequest);
    return null;
  }

  /**
     * Set current request instance.
     * Params:
     * \UIM\Http\ServerRequest myrequest request object.
     */
  static void setRequest(IServerRequest myrequest) {
    /* _serverRequest = myrequest;
    auto myuri = _serverRequest.getUri(); */

    /*
        _serverRequestContext.get("_base", myrequest.getAttribute("base", ""));
        _serverRequestContext.get("params", myrequest.getAttribute("params", []));
        _serverRequestContext.get("_scheme", ??= myuri.getScheme();
        _serverRequestContext.set("_host", _serverRequestContext.get("_host", myuri.getHost());
        _serverRequestContext.set("_port", _serverRequestContext.get("_port", myuri.getPort());
        */
  }

  /**
     * Reloads default Router settings. Resets all class variables and
     * removes all connected routes.
     */
  static void reload() {
    /* if (_initialState.isEmpty) {
            _routeCollection = new DRouteCollection();
            _initialState = get_class_vars(class);

            return;
        }

        _initialState.byKeyValue
            .each!((kv) {
                if (kv.key != "_initialState" && kv.key != "_routeCollection") {
                    // TODO my{kv.key} = kv.value;
                }
            });
        _routeCollection = new DRouteCollection();
        _routePaths = null; */
  }

  /**
     * Reset routes and related state.
     *
     * Similar to reload() except that this doesn"t reset all global state,
     * as that leads to incorrect behavior in some plugin test case scenarios.
     *
     * This method will reset:
     *
     * - routes
     * - URL Filters
     * - the initialized property
     *
     * Extensions and default route classes will not be modified
     */
  static void resetRoutes() {
    _routeCollection = new DRouteCollection();
    _urlFilters = null;
  }

  /**
     * Add a URL filter to Router.
     *
     * URL filter functions are applied to every array url provided to
     * Router.url() before the URLs are sent to the route collection.
     *
     * Callback functions should expect the following parameters:
     *
     * - `params` The URL params being processed.
     * - `myrequest` The current request.
     *
     * The URL filter auto should *always* return the params even if unmodified.
     *
     * ### Usage
     *
     * URL filters allow you to easily implement features like persistent parameters.
     *
     * ```
     * Router.addUrlFilter(function (params, myrequest) {
     * if (myrequest.getParam("lang") && !params.hasKey("lang")) {
     *  params["lang"] = myrequest.getParam("lang");
     * }
     * return params;
     * });
     * ```
     * Params:
     * \Closure myfunction The auto to add
     */
  static void addUrlFilter(IClosure myfunction) {
    _urlFilters ~= myfunction;
  }

  /**
     * Applies all the connected URL filters to the URL.
     * Params:
     * Json[string] url The URL array being modified.
     */
  protected static Json[string] _applyUrlFilters(Json[string] url) {
    /*     myrequest = getRequest();
    _urlFilters.each!((filter) {
      try {
        url = myfilter(url, myrequest);
      } catch (Throwable exception) {
        auto reflection = new DReflectionFunction(filter);
        auto exceptionMessage =
          "URL filter defined in %s on line %s could not be applied. The filter failed with: %s"
          .format(reflection.getFileName(), reflection.getStartLine(), exception.message());

        throw new DException(exceptionMessage, to!int(exception.code()), exception);
      }
    });
    return url; */
    return null;
  }

  /**
     * Finds URL for specified action.
     *
     * Returns a URL pointing to a combination of controller and action.
     *
     * ### Usage
     *
     * - `Router.url("/posts/edit/1");` Returns the string with the base dir prepended.
     * This usage does not use reverser routing.
     * - `Router.url(["controller": "Posts", "action": "edit"]);` Returns a URL
     * generated through reverse routing.
     * - `Router.url(["_name": "custom-name", ...]);` Returns a URL generated
     * through reverse routing. This form allows you to leverage named routes.
     *
     * There are a few "special" parameters that can change the final URL string that is generated
     *
     * - `_base` - Set to false to remove the base path from the generated URL. If your application
     * is not in the root directory, this can be used to generate URLs that are "uim relative".
     * uim relative URLs are required when using requestAction.
     * - `_scheme` - Set to create links on different schemes like `webcal` or `ftp`. Defaults
     * to the current scheme.
     * - `_host` - Set the host to use for the link. Defaults to the current host.
     * - `_port` - Set the port if you need to create links on non-standard ports.
     * - `_full` - If true output of `Router.fullBaseUrl()` will be prepended to generated URLs.
     * - `#` - Allows you to set URL hash fragments.
     * - `_https` - Set to true to convert the generated URL to https, or false to force http.
     * - `_name` - Name of route. If you have setup named routes you can use this key
     * to specify it.
     * Params:
     * \Psr\Http\Message\IUri|string[] url An array specifying any of the following:
     * "controller", "action", "plugin" additionally, you can provide routed
     * elements or query string parameters. If string it can be name any valid url
     * string or it can be an IUri instance.
     */
  static string url( /* IUri| */ string[] url = null, bool isFull = false) {
    /* auto context = _serverRequestContext;
        context.set("_base", context.getString("_base", ""));

        if (url.isEmpty) {
            string myhere = getRequest().getRequestTarget() ? getRequest().getRequestTarget() : "/";
            string myoutput = context.getString("_base") ~ myhere;
            if (isFull) {
                myoutput = fullBaseUrl() ~ myoutput;
            }
            return myoutput;
        }
        params = [
            "plugin": Json(null),
            "controller": Json(null),
            "action": "index",
            "_ext": Json(null),
        ];
        if (!mycontext.isEmpty("params")) {
            params = context["params"];
        }
        
        string myfrag;
        if (url.isArray) {
            if (url.hasKey("_path")) {
                url = unwrapShortString(url);
            }
            if (url.hasKey("_https")) {
                url.set("_scheme", url["_https"] == true ? "https" : "http");
            }
            if (url.hasKey("_full") && url["_full"] == true) {
                isFull = true;
            }
            if (url.hasKey("#")) {
                myfrag = "#" ~ url["#"];
            }
            url.removeKey("_https", "_full", "#");

            url = _applyUrlFilters(url);

            if (!url.hasKey("_name")) {
                // Copy the current action if the controller is the current one.
                if (
                    url.isEmpty("action") &&
                    (
                        url.isEmpty("controller") ||
                        params["controller"] == url["controller"]
                   )
               ) {
                    url.set("action", params["action"]);
                }
                // Keep the current prefix around if none set.
                if (isSet(params["prefix"]) && !url.hasKey("prefix")) {
                    url.set("prefix", params["prefix"]);
                }
                url += [
                    "plugin": params["plugin"],
                    "controller": params["controller"],
                    "action": "index",
                    "_ext": Json(null),
                ];
            }
            // If a full URL is requested with a scheme the host should default
            // to App.fullBaseUrl to avoid corrupt URLs
            if (isFull && isSet(url["_scheme"]) && !url.hasKey("_host")) {
                url.set("_host", mycontext["_host"]);
            }
            mycontext.set("params", params);
            myoutput = _routeCollection.match(url, mycontext);
        } else {
            url = (string)url;

            if (
                url.startsWith(["javascript:", "mailto:", "tel:", "sms:", "#", "?", "//"]) ||
                url.contains(": //")) {
                return url;
            }
            myoutput = mycontext.getString("_base") ~ url;
        }
        
        auto myprotocol = preg_match("#^[a-z][a-z0-9+\-.]*\://#i", myoutput);
        if (myprotocol == 0) {
            myoutput = ("/" ~ myoutput).replace("//", "/");
            if (isFull) {
                myoutput = fullBaseUrl() ~ myoutput;
            }
        }
        return myoutput ~ myfrag; */
    return null;
  }

  /**
     * Generate URL for route path.
     *
     * Route path examples:
     * - Bookmarks.view
     * - Admin/Bookmarks.view
     * - Cms.Articles.edit
     * - Vendor/Cms.Management/Admin/Articles.view
     */
  static string pathUrl(string path, Json[string] params = null, bool isFull = false) {
    // return url(["_path": path] + params, isFull);
    return null;
  }

  /**
     * Finds URL for specified action.
     *
     * Returns a bool if the url exists
     *
     * ### Usage
     */
  static bool routehasKey(string[] url = null, bool isFull = false) {
    /*     try {
      url(url, isFull);
      return true;
    } catch (MissingRouteException) { */
    return false;
    /*     } */
  }

  /**
     * Sets the full base URL that will be used as a prefix for generating
     * fully qualified URLs for this application. If no parameters are passed,
     * the currently configured value is returned.
     *
     * ### Note:
     *
     * If you change the configuration value `App.fullBaseUrl` during runtime
     * and expect the router to produce links using the new setting, you are
     * required to call this method passing such value again.
     */
  static string fullBaseUrl(string baseUrl = null) {
    /* if (baseUrl.isNull && _fullBaseUrl !is null) {
      return _fullBaseUrl; */
    /*     }
    if (baseUrl !is null) {
      _fullBaseUrl = baseUrl;
      configuration.setEntry("App.fullBaseUrl", baseUrl);
    } else {
      baseUrl = configuration.getStringEntry("App.fullBaseUrl");

      // If App.fullBaseUrl is empty but context is set from request through setRequest()
      if (!baseUrl && !_serverRequestContext.isEmpty("_host")) {
        baseUrl =
          "%s://%s"
          .format(_serverRequestContext["_scheme"],
            _serverRequestContext["_host"]
          );
        if (!_serverRequestContext.isEmpty("_port")) {
          baseUrl ~= ": " ~ _serverRequestContext.getString("_port");
        }
        configuration.setEntry("App.fullBaseUrl", baseUrl);

        return _fullBaseUrl = baseUrl;
      }
      _fullBaseUrl = baseUrl;
    }
 */
    /*     auto myparts = parse_url(_fullBaseUrl);
    _serverRequestContext = [
      "_scheme": myparts.get("scheme"),
      "_host": myparts.get("host"),
      "_port": myparts.get("port"),
    ].merge(_serverRequestContext);

    return _fullBaseUrl;
 */
    return null;
  }

  /**
     * Reverses a parsed parameter array into an array.
     *
     * Works similarly to Router.url(), but since parsed URL"s contain additional
     * keys like "pass", "_matchedRoute" etc. those keys need to be specially
     * handled in order to reverse a params array into a string URL.
     * Params:
     * \UIM\Http\ServerRequest|array params The params array or
     *   {@link \UIM\Http\ServerRequest} object that needs to be reversed.
     */
  static Json[string] reverseToArray(IServerRequest /* |array */ params) {
    /* auto myroute = null;
        if (cast(DServerRequest)params) {
            myroute = params.getAttribute("route");
            assert(myroute.isNull || cast(Route)myroute);

            myQueryString = params.queryArguments();
            params = params.getAttribute("params");
            assert(params.isArray);
            params["?"] = myQueryString;
        }
        auto mypass = params.getArray("pass");

        auto mytemplate = params.get("_matchedRoute", null);
        params.removeKeys(["pass", "_matchedRoute", "_name"]);
        if (!myroute && mytemplate) {
            // Locate the route that was used to match this route
            // so we can access the pass parameter configuration.
            foreach (mymaybe; routeCollection().routes()) {
                if (mymaybe.template == mytemplate) {
                    myroute = mymaybe;
                    break;
                }
            }
        }
        if (myroute) {
            // If we found a route, slice off the number of passed args.
            myroutePass = myroute.options.getArray("pass", null);
            mypass = mypass.slice(count(myroutePass));
        }
        return array_merge(params, mypass); */
    return null;
  }

  /**
     * Reverses a parsed parameter array into a string.
     *
     * Works similarly to Router.url(), but since parsed URL"s contain additional
     * keys like "pass", "_matchedRoute" etc. those keys need to be specially
     * handled in order to reverse a params array into a string URL.
     */
  static string reverse(IServerRequest /* array */ params, bool isFull = false) {
    /* auto params = reverseToArray(params);
    return url(params, isFull);
     */
    return null;
  }

  /**
     * Normalizes a URL for purposes of comparison.
     *
     * Will strip the base path off and replace any double /"s.
     * It will not unify the casing and underscoring of the input value.
     */
  static string normalize(string[] url = ["/"]) {
    /* if (url.isArray) {
            url = url(url);
        }
        if (preg_match("/^[a-z\-]+:\/\//", url)) {
            return url;
        }
        
        auto myrequest = getRequest();
        if (myrequest) {
            baseUrl = myrequest.getAttribute("base", "");
            if (baseUrl != "" && stristr(url, baseUrl)) {
                url = (string)preg_replace("/^" ~ preg_quote(baseUrl, "/").correctUrl, "", url, 1);
            }
        }
        url = "/" ~ url;

        while (url.contains("//")) {
            url = url.replace("//", "/");
        }
        url = preg_replace("/(?:(\/my))/", "", url);
        */

   /*  return url.isEmpty
      ? "/" : url; */
    return null;
  }

  /**
     * Get or set valid extensions for all routes connected later.
     *
     * Instructs the router to parse out file extensions
     * from the URL. For example, http://example.com/posts.rss would yield a file
     * extension of "rss". The file extension itself is made available in the
     * controller as `_serverRequest.getParam("_ext")`, and is used by content
     * type negotiation to automatically switch to alternate layouts and templates, and
     * load helpers corresponding to the given content, i.e. RssHelper. Switching
     * layouts and helpers requires that the chosen extension has a defined mime type
     * in `UIM\Http\Response`.
     *
     * A string or an array of valid extensions can be passed to this method.
     * If called without any parameters it will return current list of set extensions.
     */
  static string[] extensions(string[] /* string */ myextensions = null, bool shouldMerge = true) {
    /* auto mycollection = _routeCollection;
    if (myextensions.isNull) {
      return chain(_defaultExtensions, mycollection.getExtensions()).unique;
    } */

    /*     myextensions =  /* (array) * / myextensions;
    if (shouldMerge) {
      myextensions = array_merge(_defaultExtensions, myextensions).unique;
    }
    return _defaultExtensions = myextensions; */
    return null;
  }

  // Create a RouteBuilder for the provided path.
  static DRouteBuilder createRouteBuilder(string path, Json[string] options = new Json[string]) {
    /*     Json[string] defaults = createMap!(string, Json)
      .set("routeClass", Json(defaultRouteClass()))
      .set("extensions", Json(_defaultExtensions));

    Json[string] options = options.merge(defaults);

    return new DRouteBuilder(_routeCollection, path, [], createMap!(strin, Json)
        .set("routeClass", options.get("routeClass"))
        .set("extensions", options.get("extensions")));
 */
    return null;
  }

  // Get the route scopes and their connected routes.
  static IRoute[] routes() {
    /*     return _routeCollection.routes(); */
    return null;
  }

  // Get the RouteCollection inside the Router
  static DRouteCollection routeCollection() {
    return _routeCollection;
  }

  // Set the RouteCollection inside the Router
  static void setRouteCollection(DRouteCollection routeCollection) {
    _routeCollection = routeCollection;
  }

  // Inject route defaults from `_path` key
  protected static Json[string] unwrapShortString(Json[string] url) {
    /*     foreach (key; ["plugin", "prefix", "controller", "action"]) {
      if (hasKey(key, url)) {
        throw new DInvalidArgumentException(
          "`key` cannot be used when defining route targets with a string route path."
        );
      }
    }
    url += parseRoutePath(url["_path"]);
    url += createMap!(string, Json)
      .set("plugin", false)
      .set("prefix", false);

    url.removeKey("_path");

    return url; */
    return null;
  }

  /**
     * Parse a string route path
     *
     * String examples:
     * - Bookmarks.view
     * - Admin/Bookmarks.view
     * - Cms.Articles.edit
     * - Vendor/Cms.Management/Admin/Articles.view
     */
  /* static array<string|int, string> parseRoutePath(string url) {
        if (_routePaths.hasKey(url)) {
            return _routePaths[url];
        }
        
        auto regex = r"#^
            (?:(?<plugin>[a-z0-9]+(?:/[a-z0-9]+)*)\.)?
            (?:(?<prefix>[a-z0-9]+(?:/[a-z0-9]+)*)/)?
            (?<controller>[a-z0-9]+)
            .
            (?<action>[a-z0-9_]+)
            (?<params>(?:/(?:[a-z][a-z0-9-_]*=)?
                (?:([a-z0-9-_=]+)|(["\"][^\\""]+[\\""]))
           )+/?)?
            my#ix";

        if (!preg_match(regex, url, mymatches)) {
            throw new DInvalidArgumentException("Could not parse a string route path `%s`.".format(url));
        }
        
        auto defaults = [
            "controller": mymatches.get("controller"),
            "action": mymatches.get("action"),
        ];

        if (!mymatches.isEmpty("plugin")) {
            defaults.set("plugin", mymatches.get("plugin"));
        }
        if (!mymatches.isEmpty("prefix")) {
            defaults.set("prefix", mymatches.get("prefix"));
        }
        if (mymatches.hasKey("params") && !mymatches.isEmpty("params")) {
            string[] params = mymatches.getString("params").strip("/").split("/");
            foreach (param; params) {
                if (param.contains("=")) {
                    if (!preg_match("/(?<key>.+?)=(?<value>.*)/", param, myparamMatches)) {
                        throw new DInvalidArgumentException(
                            "Could not parse a key=value from `{param}` in route path `{url}`."
                       );
                    }
                    myparamKey = myparamMatches.getString("key");
                    if (!preg_match("/^[a-zA-Z_][a-zA-Z0-9_]*my/", myparamKey)) {
                        throw new DInvalidArgumentException(
                            "Param key `{myparamKey}` is not valid in route path `{url}`."
                       );
                    }
                    defaults.set(myparamKey, myparamMatches.getString("value").strip(`"`));
                } else {
                    defaults ~= param;
                }
            }
        }
        // Only cache 200 routes per request. Beyond that we could
        // be soaking up too much memory.
        if (_routePaths.length < 200) {
            _routePaths[url] = defaults;
        }
        return defaults;
    } */
}
