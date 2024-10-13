//
//  MissionView.swift
//  Moonshot
//
//  Created by Michael Danko on 10/12/24.
//

import SwiftUI

struct MissionView: View {
   
    let mission: Mission
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String:Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    
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
                    UIDivider()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                    UIDivider()
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.top, 5)
                        .padding(.bottom, 10)
                }
                .padding(.horizontal, 20)
                
                
                
                // VStack to display crew images
                VStack(alignment: .leading) {
//                    Text("Crew")
//                        .font(.title.bold())
//                        .padding(.bottom, 5)
//                        .padding(.horizontal)
                }
                
//                Button("Print CrewRole") {
//                    print(mission.crew)
//                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 140)
                                        .clipShape(.circle)
                                        .overlay(Circle().strokeBorder(.white, lineWidth: 3))
                                    VStack {
                                        Text(crewMember.astronaut.name)
                                            .font(.headline).fontWeight(.bold)
                                            .foregroundStyle(Color.white)
                                        Text(crewMember.role)
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white.opacity(0.5))
                                        
                                    }
                                } // End of HStack
                                .padding(.trailing)
                            }
                        }
                    }
                } // End of horizontal ScrollView
                .scrollIndicators(.never)
                
//                ScrollView(.horizontal) {
//                    HStack {
//                        ForEach(mission.crew, id: \.name) { crewMember in
//                            VStack {
//                                Image(crewMember.name)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .clipShape(.circle)
//                                    .padding(.top)
//                                Text(crewMember.name.capitalized)
//                                    .font(.headline).fontWeight(.bold)
//                                Text(crewMember.role.capitalized)
//                                    .font(.subheadline)
//                                    .fontWeight(.bold)
//                                    .foregroundStyle(.white.opacity(0.5))
//                            }
//                        } // End of ForEach
//                    } // End of HStack
//                } // End of ScrollView
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
    let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    MissionView(mission: missions[0], astronauts: astronauts)
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
