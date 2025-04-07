/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.validations.interfaces.validatoraware;

import uim.validations;
@safe:

// Provides methods for managing multiple validators.
interface IValidatorAware {
    /**
     * Returns the validation rules tagged with myname.
     *
     * If a myname argument has not been provided, the default validator will be returned.
     * You can configure your default validator name in a `DEFAULT_VALIDATOR`
     * class DConstant.
     */
    /* DValidator getValidator(string name = null); */

    // This method stores a custom validator under the given name.
    /* void setValidator(string validatorName, DValidator validator);

    // Checks whether a validator has been set.
    bool hasValidator(string validatorName); */
}
