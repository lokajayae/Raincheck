//
//  SplashScreen.swift
//  Raincheck
//
//  Created by Evan Lokajaya on 01/06/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        }
        else {
            VStack {
                VStack {
                    Image("raincheckLogo")
                        .resizable()
                        .frame(width:250, height: 250)
                        .padding()
                    Text("Raincheck")
                        .font(.system(size: 40))
                        .foregroundStyle(.white.opacity(0.8))
                    
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color("backgroundColor"))
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
