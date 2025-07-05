//
//  ContentView.swift
//  HoneyMoon
//
//  Created by Atharva Gaikwad on 17/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    
    @State private var cardViews: [CardView] = [
        CardView(honeymoon: honeymoonData[0]),
        CardView(honeymoon: honeymoonData[1])
    ]

    private func moveCards() {
        cardViews.removeFirst()
        lastCardIndex += 1
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            if case .dragging = self { return true }
            return false
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging: return true
            case .inactive: return false
            }
        }
    }
    
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $showGuide)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(self.cardOverlay(for: cardView))
                        .offset(self.cardOffset(for: cardView))
                        .scaleEffect(self.cardScale(for: cardView))
                        .rotationEffect(self.cardRotation(for: cardView))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.translation)
                        .gesture(cardGesture(for: cardView))
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!"))
            )
        }
    }
    
    // MARK: - Helper Methods
    
    private func cardOverlay(for cardView: CardView) -> some View {
        ZStack {
            Image(systemName: "x.circle")
                .modifier(SymbolModifier())
                .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: cardView) ? 1.0 : 0.0)
            
            Image(systemName: "heart.circle")
                .modifier(SymbolModifier())
                .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView) ? 1.0 : 0.0)
        }
    }
    
    private func cardOffset(for cardView: CardView) -> CGSize {
        isTopCard(cardView: cardView) ? dragState.translation : .zero
    }
    
    private func cardScale(for cardView: CardView) -> CGFloat {
        dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1.0
    }
    
    private func cardRotation(for cardView: CardView) -> Angle {
        Angle(degrees: isTopCard(cardView: cardView) ? Double(dragState.translation.width / 12) : 0)
    }
    
    private func cardGesture(for cardView: CardView) -> some Gesture {
        LongPressGesture(minimumDuration: 0.01)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, _ in
                switch value {
                case .first(true):
                    state = .pressing
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                default:
                    break
                }
            }
            .onEnded { value in
                guard case .second(true, let drag?) = value else { return }
                if abs(drag.translation.width) > dragAreaThreshold {
                    moveCards()
                }
            }
    }
}

#Preview {
    ContentView()
}
