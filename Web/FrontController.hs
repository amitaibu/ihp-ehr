module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.ObservationDevices
import Web.Controller.Authorities
import Web.Controller.Static

instance FrontController WebApplication where
    controllers =
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @ObservationDevicesController
        , parseRoute @AuthoritiesController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
