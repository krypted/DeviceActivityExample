# DeviceActivityExample
Interrogates the iOS DeviceActivity API

This project is just meant to experiment around with the DeviceActivity API documented at https://developer.apple.com/documentation/deviceactivity. Requires the DeviceActivity entitlement (er, com.apple.developer.family-controls) to load the DeviceActivity Monitor Extension (aka com.apple.deviceactivity.monitor-extension). 

A few things to know:
* Users need to be in the same Family Plan (there might be a way around this)
* The app requires authorization (understandable but there isn't any error correction in the experimentation app to correct for a state where a device hasn't granted it).
* We have to import FamilyControls, ManagedSettings, and DeviceActivity according to the type of atomic operation we're trying to complete
* There are placeholders to implement scheduled events
