//
//  ContentView.swift
//  Moonshot
//
//  Created by Michael Danko on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    
    let gridcolumns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
//        Text("\(astronauts.count)")
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridcolumns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail View")
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.lightBackground)
                            )
//                            .background(.darkbackground)
                            
                        }
                    }
                }
            } // End of ScrollView
            .navigationTitle("Moonshot")
            .background(Color.darkbackground)
            .preferredColorScheme(.dark)
        } // End of NavigationStack
    }
}

#Preview {
    ContentView()
}
