//
//  ContentViewModel.swift
//  Settingbundle
//
//  Created by Nitanta Adhikari on 24/03/2023.
//

import Combine
import Foundation
import SwiftUI

final class ContentViewModel: ObservableObject {
    private var bag = Set<AnyCancellable>()
    
    @AppStorage("select_location") var locationIndex: Int = 0
    var locationOptions = ["KATHMANDU", "MUMBAI", "BANGKOK"]
    @AppStorage("username") var username: String = ""
    @AppStorage("level") var level: Double = 0
    @AppStorage("reset") var resetApp: Bool = false
    @AppStorage("app_version") private(set) var version: String = "1.0"
        
    init() {
        setupData()
    }
    
    private func setupData() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        self.version = appVersion ?? String()
    }
    
    deinit {
        debugPrint("Deint: \(String(describing: self))")
    }
}


