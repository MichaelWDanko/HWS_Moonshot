//
//  MissionView.swift
//  Moonshot
//
//  Created by Michael Danko on 10/12/24.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        return width * 0.6
                    }
                    .padding(.top)
                
                // VStack to display mission highlights and mission description
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                }
                .padding(.horizontal)
                
                // VStack to display crew images
                VStack(alignment: .leading){
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                
//                Button("Print CrewRole") {
//                    print(mission.crew)
//                }
                
                VStack {
                    ForEach(mission.crew, id: \.name) { crewMember in
                        VStack {
                            Image(crewMember.name)
                                .resizable()
                                .scaledToFit()
                                .clipShape(.circle)
                                .padding(.top)
                            Text(crewMember.name.capitalized)
                                .font(.headline)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.darkbackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode(file: "missions.json")

    MissionView(mission: missions[0])
        .preferredColorScheme(.dark)
}


//#Preview {
//    let previewCrewRole: [Mission.CrewRole] = [
//        Mission.CrewRole(name: "borman", role: "Commander"),
//        Mission.CrewRole(name: "lovell", role: "Command Module Pilot")
//    ]
//    let previewMission = Mission(id: 8, launchDate: nil, crew: previewCrewRole, description: "Sample mission description")
//    
//    MissionView(mission: previewMission)
//}
