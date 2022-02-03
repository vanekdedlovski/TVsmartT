//
//  SplashScreen.swift
//  TVsmartT
//
//  Created by bnkwsr2 on 03.02.2022.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var screen : String
    @State var Animation1 = false
    @State var Animation2 = false
    
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        VStack {
            HStack {
                Text("WSR Food")
                    .font(.system(size: 140))
                    .opacity(Animation1 ? 1 : 0)
                    .position(x: 380, y: 100)
            
            }
            HStack {
                if (!Animation2) {
                    Image("cooking1")
                        .padding(.top,380)
                        .opacity(Animation1 ? 1 : 0)
                }
                if (Animation2) {
                    VStack(alignment: .leading) {
                        VStack {
                            HStack {
                                Text("Email")
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Spacer()
                            }
                            TextField("", text: $mainModule.email, prompt: Text("email"))
                                .textFieldStyle(PlainTextFieldStyle())
                                .background(
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(.black)
                                    ,
                                    alignment: .bottom
                                )
                        }
                        .padding(.bottom,30)
                        VStack {
                            HStack {
                                Text("Password")
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Spacer()
                            }
                            SecureField("", text: $mainModule.password, prompt: Text("email"))
                                .background(
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(.black)
                                    ,
                                    alignment: .bottom
                                )
                        }
                        VStack {
                            HStack {
                                Button {
                                    
                                } label: {
                                    Text("Forgot password?")
                                        .font(.system(size: 40))
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                            

                        }
                        .padding(.vertical,40)
                        VStack {
                            Button {
                                withAnimation {
                                    mainModule.Loginln {
                                        screen = "TVMapScreen"
                                    } error: {
                                        print(124)
                                    }

                                }
                            } label: {
                                Text("Login")
                                    .frame(width: 500, height: 110)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundColor(Color("MyOrange"))
                                    )
                            }
                            .buttonStyle(PlainButtonStyle())

                        }
                        
                    }
                    .offset(x: -60 ,y: -60)
                    .frame(width: 500, height: 510)
                }
                
                VStack(spacing: -40) {
                    Image("cooking0")
                        .padding(.leading,100)
                        .offset(x: Animation2 ? UIScreen.main.bounds.width / 6.5 : 0 , y: Animation2 ? -300 : 0)
                    if (!Animation2) {
                        Image("fire0")
                    }
                }
                .padding(.top,300)
                if (!Animation2) {
                    Image("cooking3")
                        .padding(.top,380)
                        .opacity(Animation1 ? 1 : 0)
                }
            }
        }
        .background(Image("background-image"))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation(.spring()) {
                    Animation1 = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                        withAnimation {
                            Animation2 = true
                        }
                    }
                }
            }
        }
    }
}
//
//struct SplashScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SplashScreen(screen: .constant("SplashScreen"))
//    }
//}
