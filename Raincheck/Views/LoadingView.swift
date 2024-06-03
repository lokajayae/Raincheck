//
//  LoadingView.swift
//  Raincheck
//
//  Created by Evan Lokajaya on 30/05/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.white)
            .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    LoadingView()
}
