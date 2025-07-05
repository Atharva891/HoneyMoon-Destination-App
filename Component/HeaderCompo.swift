//
//  HeaderCompo.swift
//  HoneyMoon
//
//  Created by Atharva Gaikwad on 17/06/25.
//

import SwiftUI

struct HeaderCompo: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Capsule()
                .frame(width: 120,height: 6)
                .foregroundColor(Color.secondary)
                .opacity(0.2)
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        }
    }
}

#Preview {
    HeaderCompo()
}
