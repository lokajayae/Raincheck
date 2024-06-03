//
//  WelcomeView.swift
//  Raincheck
//
//  Created by Evan Lokajaya on 30/05/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationController: LocationController
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to Raincheck").bold()
                Text("Allow us to access your current location to display weather information.")
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareMyCurrentLocation) {
                locationController.requstLocation()
            }
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
