//
//  iCloudUbiquitousKeyValueApp.swift
//  iCloudUbiquitousKeyValue
//
//  Created by Abhinay Maurya on 26/07/24.
//

import SwiftUI

@main
struct iCloudUbiquitousKeyValueApp: App {
    var body: some Scene {
        WindowGroup {
            ONSContentView(viewModel: ONSContentViewVM())
        }
    }
}
