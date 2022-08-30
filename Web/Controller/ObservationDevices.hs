module Web.Controller.ObservationDevices where

import Web.Controller.Prelude
import Web.View.ObservationDevices.Index
import Web.View.ObservationDevices.New
import Web.View.ObservationDevices.Edit
import Web.View.ObservationDevices.Show

instance Controller ObservationDevicesController where
    action ObservationDevicesAction = do
        (observationDevicesQ, pagination) <- query @ObservationDevice |> paginate
        observationDevices <- observationDevicesQ |> fetch
        render IndexView { .. }

    action NewObservationDeviceAction = do
        let observationDevice = newRecord
        render NewView { .. }

    action ShowObservationDeviceAction { observationDeviceId } = do
        observationDevice <- fetch observationDeviceId
        render ShowView { .. }

    action EditObservationDeviceAction { observationDeviceId } = do
        observationDevice <- fetch observationDeviceId
        render EditView { .. }

    action UpdateObservationDeviceAction { observationDeviceId } = do
        observationDevice <- fetch observationDeviceId
        observationDevice
            |> buildObservationDevice
            |> ifValid \case
                Left observationDevice -> render EditView { .. }
                Right observationDevice -> do
                    observationDevice <- observationDevice |> updateRecord
                    setSuccessMessage "ObservationDevice updated"
                    redirectTo EditObservationDeviceAction { .. }

    action CreateObservationDeviceAction = do
        let observationDevice = newRecord @ObservationDevice
        observationDevice
            |> buildObservationDevice
            |> ifValid \case
                Left observationDevice -> render NewView { .. } 
                Right observationDevice -> do
                    observationDevice <- observationDevice |> createRecord
                    setSuccessMessage "ObservationDevice created"
                    redirectTo ObservationDevicesAction

    action DeleteObservationDeviceAction { observationDeviceId } = do
        observationDevice <- fetch observationDeviceId
        deleteRecord observationDevice
        setSuccessMessage "ObservationDevice deleted"
        redirectTo ObservationDevicesAction

buildObservationDevice observationDevice = observationDevice
    |> fill @'["name"]
