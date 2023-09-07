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

/*struct ContentView: View {
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



struct NavView: View {
    var body: some View {
        Text("Oh Vanthuttaya ")
            .font(.largeTitle)
            .padding()
    }
} */

/*struct ContentView: View {
    
    @StateObject var dataModel = MyDataModel()
    
    var body: some View {
        VStack {
            Text("Increment\(dataModel.count)")
            Button {
                dataModel.increment()
            } label: {
                Text("TapMe")
                    .background(Color.red)
            }
        }
        .padding()
    }
}

class MyDataModel: ObservableObject {
   @Published var count = 0
    
    func increment() {
           count += 1
       }
} */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ContentView: View {
    @StateObject var userViewModel = UserLoginModel()
    @State var isLoginSuccessful: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                LoginView()
                InputView(isLoginSuccessful: $isLoginSuccessful, viewModel: userViewModel)
                NavigationLink(destination: NextScreenView(), isActive: $isLoginSuccessful) {
                    EmptyView()
                }
                Spacer()
            }
            
        }
       
    }
}

struct LoginView: View {
    var body: some View {
        Text("Design Forest")
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 240))
            .multilineTextAlignment(.leading)
        Image("login")
            .padding(EdgeInsets(top: 130, leading: 0, bottom: 0, trailing: 0))
            .frame(width: 100, height: 50)
        
        Text("LOGIN")
            .bold()
            .font(.system(size: 40))
            .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
    }
}

struct InputView: View {
    @State private var UserNameText = ""
    @State private var PassWordText = ""
    @State private var isPresentToast = false
    @State private var toastMessage = ""
    @Binding var isLoginSuccessful: Bool
    @State private var isTextVisible = false
    
    @StateObject var viewModel: UserLoginModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
                .background(Color(hex: "#FCDDD0"))
            
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                
                TextField("Username", text: $viewModel.userName)
                    .foregroundColor(.black)
                    .padding(.leading, 40)
                    .multilineTextAlignment(.leading)
            }
            .padding(10)
        }
        .frame(width: 300, height: 50)
        .cornerRadius(10)
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
                .background(Color(hex: "#FCDDD0"))
            
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                
                TextField("password", text: $viewModel.password)
                    .foregroundColor(.black)
                    .padding(.leading, 40)
            }
            .padding(10)
        }
        .frame(width: 300, height: 50)
        .cornerRadius(10)
        .padding(.top, 20)
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
                .background(Color(hex: "#F23A10"))
                .cornerRadius(10)
            Button {
                if viewModel.login() {
                    isLoginSuccessful = true
                   
                } else {
                    toastMessage = "Login failed. Check your credentials."
                    isPresentToast = true
                }
            } label: {
                Text("Login")
                    .bold()
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
        }
        .frame(width: 300, height: 50)
        .padding(.top, 50)
        .cornerRadius(10)
        .overlay(
            Group {
                if isPresentToast {
                    ToastView(isPresented: $isPresentToast, message: toastMessage)
                        .padding(.top, 16)
                }
            }
        )
        HStack {
            Text("forgot Password")
                .padding(EdgeInsets(top: 30, leading: 16, bottom: 0, trailing: 16))
                .font(.system(size: 12))
            Spacer()
            Text("help")
                .padding(EdgeInsets(top: 30, leading: 16, bottom: 0, trailing: 16))
                .font(.system(size: 12))
           
        }
        
        HStack {
            Text("Not Registered?")
                .padding(EdgeInsets(top: 220, leading: 10, bottom: 0, trailing: 16))
                .font(.system(size: 12))
            Button {
                
            } label: {
                Text("Create account")
                    .padding(EdgeInsets(top: 220, leading: -20, bottom: 0, trailing: 0))
                    .font(.system(size: 12))
                    .foregroundColor(Color.red)
            }
        }
    }
}

struct NextScreenView: View {
    var body: some View {
        Text("Welcome to the next screen!")
            .navigationTitle("Next Screen")
    }
}
