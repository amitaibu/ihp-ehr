module Web.View.ObservationDevices.New where
import Web.View.Prelude

data NewView = NewView { observationDevice :: ObservationDevice }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New ObservationDevice</h1>
        {renderForm observationDevice}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "ObservationDevices" ObservationDevicesAction
                , breadcrumbText "New ObservationDevice"
                ]

renderForm :: ObservationDevice -> Html
renderForm observationDevice = formFor observationDevice [hsx|
    {(textField #name)}
    {submitButton}

|]