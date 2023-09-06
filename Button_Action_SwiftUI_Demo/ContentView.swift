//
//  ContentView.swift
//  Button_Action_SwiftUI_Demo
//
//  Created by vignesh kumar c on 06/09/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var num: Int = 0
}

struct ContentView: View {
    @State private var showAlert = false
    @State private var isShowingNewView = false
    
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Vanakkam Da Mapla \(vm.num)")
                    .font(.largeTitle)
                    .padding()
                NavigationLink(destination: NavView(), isActive: $isShowingNewView) {
                    EmptyView()
                }
                Button {
                    // isShowingNewView = true
                    self.vm.num += 1
                    
                } label: {
                    Text("Poda Anguttu")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }

            }
        }
//        VStack {
//            Text("Vanakkam da Mapla")
//                .font(.largeTitle)
//                .padding()
//            Button {
//                showAlert = true
//                print("Ethukku da click panna")
//
//            } label: {
//                Text("click karo")
//                    .font(.headline)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(10)
//            }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Click Pannitiya seri"), message: Text("Poratha pora antha keela irukkura btn ah click pannitu po"), dismissButton: .default(Text("Varan da mapla")))
//            }

//        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavView: View {
    var body: some View {
        Text("Oh Vanthuttaya ")
            .font(.largeTitle)
            .padding()
    }
}
