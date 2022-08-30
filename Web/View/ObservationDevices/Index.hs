module Web.View.ObservationDevices.Index where
import Web.View.Prelude

data IndexView = IndexView { observationDevices :: [ObservationDevice] , pagination :: Pagination }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewObservationDeviceAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>ObservationDevice</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach observationDevices renderObservationDevice}</tbody>
            </table>
            {renderPagination pagination}
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "ObservationDevices" ObservationDevicesAction
                ]

renderObservationDevice :: ObservationDevice -> Html
renderObservationDevice observationDevice = [hsx|
    <tr>
        <td>{observationDevice}</td>
        <td><a href={ShowObservationDeviceAction observationDevice.id}>Show</a></td>
        <td><a href={EditObservationDeviceAction observationDevice.id} class="text-muted">Edit</a></td>
        <td><a href={DeleteObservationDeviceAction observationDevice.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]