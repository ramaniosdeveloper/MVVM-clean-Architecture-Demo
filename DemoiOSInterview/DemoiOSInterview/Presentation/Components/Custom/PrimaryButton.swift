//
//  PrimaryButton.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 11/01/26.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    let action: () -> Void
    var font: Font = .headline
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(font)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal, 16) // left & right margin
        }
        
    }
    
}

struct SecondaryButton: View {
    var title: String
    let action: () -> Void
    var body : some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .cornerRadius(20)
                .background(.blue)
                .cornerRadius(20)
                .padding(.horizontal, 20)
        }
    }
}


struct NewButtton : View {
    
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .cornerRadius(20)
                .background(.blue)
                .padding(.horizontal, 20)
        }
    }
}
