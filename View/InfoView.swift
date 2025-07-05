//
//  InfoView.swift
//  HoneyMoon
//
//  Created by Atharva Gaikwad on 17/06/25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                HeaderCompo()
                Spacer(minLength: 10)
                Text("App Info")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
                
                AppInfoView()
                Text("Credits")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
                
                CreditView()
                Spacer(minLength: 10)
                Button {
                    
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier() )
                }

            }//vstack
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top,15)
            .padding(.bottom,25)
            .padding(.horizontal,25)
        }//scroll view
    }
}

#Preview {
    InfoView()
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iphone and ipad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Atharva Gaikwad")
            RowAppInfoView(itemOne: "Designer", itemTwo: "Atharva")
            RowAppInfoView(itemOne: "Website", itemTwo: "swiftuimasterclass.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        }
    }
}

struct RowAppInfoView: View {
    var itemOne :String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack{
                Text(itemOne).foregroundColor(Color.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            HStack{
                Text("Photos").foregroundColor(Color.gray)
                Spacer()
                Text("Unsplash")
            }
            Divider()
            Text("Photographers").foregroundColor(Color.gray)
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
    }
}
