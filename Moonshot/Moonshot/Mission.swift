//
//  Mission.swift
//  Moonshot
//
//  Created by Michael Danko on 10/11/24.
//

import Foundation


struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        return "Apollo \(id)"
    }
    
    var image: String {
        return "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
