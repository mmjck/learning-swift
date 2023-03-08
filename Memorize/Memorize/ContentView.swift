//
//  ContentView.swift
//  Memorize
//
//  Created by Jackson Matheus on 07/03/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚘", "🏎", "🚁", "🚕", "🚙", "🚌",
                  "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚔"
    ]
    
    @State var emojiCount: Int  = 14
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio( 2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                remove
                Spacer()
                 add
            }
        }
        .font(.largeTitle)
        .padding(.horizontal)
        .foregroundColor(.red)
        
        
    }
    
    var remove : some View{
        return  Button {
            if emojiCount > 1{
                emojiCount -= 1
            }
            
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add  : some View{
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        
        }
    }
}

//
struct CardView: View {
    @State var isFaceUp: Bool  = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                    shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 1)
                    .foregroundColor(.red)
                Text(
                    content
                    
                ).font(.largeTitle)
                
            } else{
                shape
                    .fill()
                    .foregroundColor(.red)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)


    }
}
