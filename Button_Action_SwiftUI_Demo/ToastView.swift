//
//  ToastView.swift
//  Button_Action_SwiftUI_Demo
//
//  Created by vignesh kumar c on 07/09/23.
//

import Foundation
import SwiftUI

struct ToastView: View {
    @Binding var isPresented: Bool
    let message: String

    var body: some View {
        VStack {
            Text(message)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .transition(.move(edge: .top))
        .animation(.default)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}
