//
//  ONSContentViewVM.swift
//  iCloudUbiquitousKeyValue
//
//  Created by Abhinay Maurya on 26/07/24.
//

import Foundation
import Combine

protocol ONSContentViewProtocol: AnyObject {
    var content: String? { get }
    
    func saveContent(text: String?)
    
}

final class ONSContentViewVM: ONSContentViewProtocol, ObservableObject {
    @Published var content: String?
    
    func saveContent(text: String?) {
        self.content = text
        ONSUbiquitousKeyValues.iCloudContent = text
    }
    
    
    init() {
        self.content = ONSUbiquitousKeyValues.iCloudContent
        self.addObserver()
    }

    private func addObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(storeDidChange),
            name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
            object: nil
        )
    }
    
    @objc private func storeDidChange(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let reasonForChange = userInfo[NSUbiquitousKeyValueStoreChangeReasonKey] as? Int,
               reasonForChange == NSUbiquitousKeyValueStoreServerChange {
                DispatchQueue.main.async {
                    self.content = ONSUbiquitousKeyValues.iCloudContent
                }
                
                print("Data changed from iCloud")
            }
        }
    }
}
