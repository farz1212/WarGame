//
//  ContentView.swift
//  XcodeDemo
//
//  Created by Farzaad Goiporia on 2023-10-23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var scores: [Score]
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack{
            Image("background-cloth").resizable().ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button{
                    deal()
                }label: {
                    Image("button")
                }
                Spacer()
                Text("Score History").foregroundColor(.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                HStack{
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    .padding(20)
                    List{
                        ForEach(scores) { score in
                            HStack{
                                Text(String(score.playerScore)).foregroundColor(.black)
                                Spacer()
                                Text(String(score.cpuScore))
                                    .foregroundColor(.black)
                            }
                            
                        }
                        .onDelete { indexes in
                            for index in indexes{
                                deleteScore( scores[index])
                            }
                        }
                    }.cornerRadius(10)
                    
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    .padding(20)
                
                }.foregroundColor(.white)
                Spacer()
            }
            
        }
    }
    //function to delete item
    func deleteScore(_ score: Score){
        context.delete(score)
    }
    
    //funtion to deal cards
    func deal(){
        let playerRCard = Int.random(in: 2...14)
        let cpuRCard = Int.random(in: 2...14)
        
        playerCard = "card" + String(playerRCard)
        cpuCard = "card" + String(cpuRCard)
        
        //Update Scores
        playerScore = playerRCard > cpuRCard ? playerScore + 1 : playerScore
        
        cpuScore = cpuRCard > playerRCard ? cpuScore + 1 : cpuScore
        
        //Save item
        let item = Score(playerScore: playerRCard, cpuScore: cpuRCard)
        context.insert(item)
    }
}

#Preview {
    ContentView()
}
