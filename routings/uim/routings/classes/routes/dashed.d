module uim.routings.classes.routes.dashed;

mixin(Version!"test_uim_routings");

import uim.routings;
@safe:

/**
 * This route class will transparently inflect the controller, action and plugin
 * routing parameters, so that requesting `/my-plugin/my-controller/my-action`
 * is parsed as `["plugin": "MyPlugin", "controller": "MyController", "action": "myAction"]`
 */
class DDashedRoute : DRoute {
    mixin(RouteThis!("Dashed"));

    /**
     * Flag for tracking whether the defaults have been inflected.
     *
     * Default values need to be inflected so that they match the inflections that
     * match() will create.
     */
    protected Json[string] _inflectedDefaults = null;
}

mixin(RouteCalls!("Dashed"));

unittest {
    assert(testRoute(new DDashedRoute));
}
