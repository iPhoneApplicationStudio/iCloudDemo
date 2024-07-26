//
//  ONSContentView.swift
//  iCloudUbiquitousKeyValue
//
//  Created by Abhinay Maurya on 26/07/24.
//

import SwiftUI

struct ONSContentView: View {
    @State private var textContent: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    @StateObject var viewModel: ONSContentViewVM
    
    var body: some View {
        VStack {
            Text("Last saved content is -> \(viewModel.content ?? "")")
            TextField("Enter text here",
                      text: $textContent)
            .textFieldStyle(.roundedBorder)
            .padding()
            .focused($isTextFieldFocused)
            
            Button("Save") {
                self.viewModel.saveContent(text: textContent)
                self.isTextFieldFocused = false
                self.textContent = ""
            }
            .padding(.init(top: 5,
                           leading: 20,
                           bottom: 5,
                           trailing: 20))
            .background(Color.red)
            .foregroundStyle(.white)
            .font(.callout)
        }
        .padding()
        .onAppear(perform: {
            
        })
    }
}

#Preview {
    ONSContentView(viewModel: ONSContentViewVM())
}
