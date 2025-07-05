//
//  GuideView.swift
//  HoneyMoon
//
//  Created by Atharva Gaikwad on 17/06/25.
//

import SwiftUI

struct GuideView: View {
    //MARK: -PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                HeaderCompo()
                
                Spacer(minLength: 10)
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
                
                Text("Discover and pick the perfect destination for your romantic HoneyMoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 25){
                    GuideCompo(
                        title: "Like",
                        subtitle: "Swpie Right",
                        description: "Do you like this destination? Touch the screen and swpie right. It will be saved to the favourites",
                        icon: "heart.circle"
                    )
                    GuideCompo(
                        title: "Dismiss",
                        subtitle: "Swpie lift",
                        description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                        icon: "xmark.circle"
                    )
                    GuideCompo(
                        title: "Book",
                        subtitle: "Tap the button",
                        description: "Our selection of honeymoon resorts is perfect setting for you to embark your new life together",
                        icon: "checkmark.circle"
                    )
                }
                Spacer(minLength: 10)
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }

            }//vstack
            .frame(minWidth: 0 , maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }// scrollview
    }
}

#Preview {
    GuideView()
}
