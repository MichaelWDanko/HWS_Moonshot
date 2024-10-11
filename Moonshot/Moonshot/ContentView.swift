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
    
    var body: some View {
        Text("\(astronauts.count)")
    }
}

#Preview {
    ContentView()
}
