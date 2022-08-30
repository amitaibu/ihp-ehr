module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data AuthoritiesController
    = AuthoritiesAction
    | NewAuthorityAction
    | ShowAuthorityAction { authorityId :: !(Id Authority) }
    | CreateAuthorityAction
    | EditAuthorityAction { authorityId :: !(Id Authority) }
    | UpdateAuthorityAction { authorityId :: !(Id Authority) }
    | DeleteAuthorityAction { authorityId :: !(Id Authority) }
    deriving (Eq, Show, Data)

data ObservationDevicesController
    = ObservationDevicesAction
    | NewObservationDeviceAction
    | ShowObservationDeviceAction { observationDeviceId :: !(Id ObservationDevice) }
    | CreateObservationDeviceAction
    | EditObservationDeviceAction { observationDeviceId :: !(Id ObservationDevice) }
    | UpdateObservationDeviceAction { observationDeviceId :: !(Id ObservationDevice) }
    | DeleteObservationDeviceAction { observationDeviceId :: !(Id ObservationDevice) }
    deriving (Eq, Show, Data)
