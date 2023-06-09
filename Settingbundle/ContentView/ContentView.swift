//
//  ContentView.swift
//  Settingbundle
//
//  Created by Nitanta Adhikari on 24/03/2023.
//

import SwiftUI
import Combine

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text(Constants.action)) {
                                        
                    Picker(selection: $viewModel.locationIndex, label: Text(Constants.selectLocation)) {
                        ForEach(0 ..< viewModel.locationOptions.count, id: \.self) {
                            Text(viewModel.locationOptions[$0])
                        }
                    }
                    
                    Slider(value: $viewModel.level, in: 0...10) {
                        Text(Constants.level)
                    }
                    
                    TextField(Constants.userName, text: $viewModel.username)
                    
                    Toggle(isOn: $viewModel.resetApp) {
                        Text(Constants.reset)
                    }
                }
                
                Section(header: Text(Constants.info)) {
                    HStack {
                        Text(Constants.version)
                        Spacer()
                        Text(viewModel.version)
                    }
                }
                
            }
            .navigationBarTitle(Constants.title)
            .onChange(of: scenePhase) { newPhase in
                switch newPhase {
                case .active:
                    viewModel.locationIndex = Int(viewModel.locationItem) ?? 0
                case .inactive:
                    viewModel.locationItem = String(viewModel.locationIndex)
                case .background:
                    debugPrint("Background")
                @unknown default:
                    break
                }
            }
        }
    }
}

extension ContentView {
    struct Constants {
        static let title = "SETTINGS APP"
        static let action = "ACTION"
        static let selectLocation = "Select location"
        static let level = "Level"
        static let userName = "Username"
        static let reset = "Reset"
        static let info = "INFO"
        static let version = "App version"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
