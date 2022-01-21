//
//  ContentView.swift
//  SwiftUITest1
//
//  Created by Rostyslav on 21.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["✈️", "🚁", "🚔", "🚀","🚈","🚖","🚘","🛵","🚊","🚟","💺","🛸","🚂","🛳","🛰"]
    
    @State var emojiCount = 12
    
    var body: some View {
        VStack {
            Text("Memoraze!")
                .font(.largeTitle)
                .frame(height: 30.0)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 67))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack(alignment: .bottom, spacing: 75) {
                autoButton
                timeButton
                flageButton
            }
            .font(.subheadline)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var emojisAutoArray = ["✈️", "🚁", "🚔", "🚀","🚈","🚖","🚘","🛵","🚊","🚟","💺","🛸","🚂","🛳","🛰"]
    var autoButton: some View {
        Button {
            emojiCount = 14
            emojis = emojisAutoArray.shuffled()
        } label: {
            VStack {
                Image(systemName: "car").font(.largeTitle)
                Text("Auto")
            }
        }
    }
    
    var timeEmodjiArray = ["🕐", "🕑", "🕒", "🕓", "🕕", "🕦", "🕖", "🕗", "🕙", "🕛", "🕜", "🕝", "🕞", "🕡", "🕣"]
    var timeButton: some View {
        Button {
            emojiCount = timeEmodjiArray.count
            emojis = timeEmodjiArray.shuffled()
        } label: {
            VStack {
                Image(systemName: "stopwatch.fill").font(.largeTitle)
                Text("Time")
            }
        }
    }
    
    var flageEmodjiArray = ["🇧🇪", "🇬🇧", "🇧🇹", "🇭🇹", "🇧🇮", "🇬🇭", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🏳️‍⚧️", "🇦🇮", "🇸🇿", "🇪🇷", "🇩🇲", "🇯🇪", "🇬🇵", "🇨🇲", "🇱🇦", "🇳🇷", "🇲🇴"]
    var flageButton: some View {
        Button {
            emojiCount = flageEmodjiArray.count
            emojis = flageEmodjiArray.shuffled()
        } label: {
            VStack {
                Image(systemName: "flag").font(.largeTitle)
                Text("Flage")
            }
        }
    }

}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
    }
}
