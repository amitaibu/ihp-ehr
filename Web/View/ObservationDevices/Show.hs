module Web.View.ObservationDevices.Show where
import Web.View.Prelude

data ShowView = ShowView { observationDevice :: ObservationDevice }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show ObservationDevice</h1>
        <p>{observationDevice}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "ObservationDevices" ObservationDevicesAction
                            , breadcrumbText "Show ObservationDevice"
                            ]