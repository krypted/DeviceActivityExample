//
//  ContentView.swift
//  DeviceActivityExample
//
//

import SwiftUI

struct ContentView: View {
    @State private var isDiscouragedPresented = false
    @State private var isEncouragedPresented = false
    
    @EnvironmentObject var model: DataModel
    
    var body: some View {

        VStack {
            Button("Select Apps to Discourage") {
                isDiscouragedPresented = true
            }
            .familyActivityPicker(isPresented: $isDiscouragedPresented, selection: $model.selectionToDiscourage)
            
            Button("Select Apps to Encourage") {
                isEncouragedPresented = true
            }
            .familyActivityPicker(isPresented: $isEncouragedPresented, selection: $model.selectionToEncourage)
        }
        .onChange(of: model.selectionToDiscourage) { newSelection in
            DataModel.shared.setShieldRestrictions()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}
