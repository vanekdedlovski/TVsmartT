//
//  TVMapScreen.swift
//  TVsmartT
//
//  Created by bnkwsr2 on 03.02.2022.
//

import SwiftUI

struct TVMapScreen: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        HStack(spacing:0) {
            VStack {
                ForEach(mainModule.Couriers, id:\.courierId) { cont in
                    let x = (Color(uiColor: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat(Float.random(in: 0...1)), blue: CGFloat(Float.random(in: 0...1)), alpha: 1)))
                    HStack(spacing: 10) {
                        Text("Courier №\(cont.courierId ?? "")")
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                        Text("\(cont.name ?? "")")
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                        Text("Number of orders: \(cont.orders.count ?? 0)")
                            .foregroundColor(.gray)
                            .font(.system(size: 24))
                    }
                    .frame(width: 505, height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(x)
                    )
                    VStack(alignment: .trailing) {
                        ForEach(cont.orders, id :\.id) {  ord in
                            
                        
                            VStack {
                                HStack {
                                    VStack {
                                        Text("\(ord.address)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 24))
                                        
                                    }
                                    VStack {
                                        Text("Order time:")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 24))
                                        Text("\(ord.date)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 24))
                                    }
                                }
                            }
                            .frame(width: 475, height: 80)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(x)
                            )
                            
                        }
                    }
                    .padding(.leading,40)
                
                    
                    
                }
                Spacer()
            }
            .onAppear(perform: {
                mainModule.GetCountrier()
            })
            .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.height)
            .background(
                Color("Silver")
            )
            VStack {
                
            }
            .frame(width: 1400, height: UIScreen.main.bounds.height)
            .background(
                .red
            )
        }
        .padding(.top,40)
    }
}

//struct TVMapScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        TVMapScreen()
//    }
//}
