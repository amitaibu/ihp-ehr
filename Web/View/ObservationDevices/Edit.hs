module Web.View.ObservationDevices.Edit where
import Web.View.Prelude

data EditView = EditView { observationDevice :: ObservationDevice }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit ObservationDevice</h1>
        {renderForm observationDevice}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "ObservationDevices" ObservationDevicesAction
                , breadcrumbText "Edit ObservationDevice"
                ]

renderForm :: ObservationDevice -> Html
renderForm observationDevice = formFor observationDevice [hsx|
    {(textField #name)}
    {submitButton}

|]