//
//  FooterView.swift
//  HoneyMoon
//
//  Created by Atharva Gaikwad on 17/06/25.
//

import SwiftUI

struct FooterView: View {
    //MARK: -PROPERTIES
    @Binding var showBookingAlert: Bool
    
    var body: some View {
        HStack{
            Image(systemName: "xmark.circle")
                .font(.system(size: 42,weight: .light))
            
            Spacer()
            
            Button(action:{
                self.showBookingAlert.toggle()
            }) {
                Text("Book Destionation")
                    .font(.system(.subheadline,design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal,20)
                    .padding(.vertical,12)
                    .accentColor(Color.pink)
                    .background(
                        Capsule().stroke(Color.pink,lineWidth: 2)
                    )
                
            }
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42,weight: .light))
        }
        .padding()
    }
}

#Preview {
    @State var showAlert: Bool = false
    FooterView(showBookingAlert: $showAlert)
}
