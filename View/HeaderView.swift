//
//  HeaderView.swift
//  HoneyMoon
//
//  Created by Atharva Gaikwad on 17/06/25.
//

import SwiftUI

struct HeaderView: View {
    //MARK: -PROPERTIES
    @Binding var showGuideView: Bool
    
    var body: some View {
        HStack{
            Button(action:{
                print("information")
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 25 ,weight: .regular))
            }
            .accentColor(Color.primary)
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button(action:{
                self.showGuideView.toggle()
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 25 ,weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showGuideView){
                GuideView()
            }
            
        }//hstack
        .padding()
    }
}

#Preview {
    @Previewable @State var showGuide: Bool = false
    HeaderView(showGuideView: $showGuide)
}
