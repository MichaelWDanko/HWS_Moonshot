//
//  ContentView.swift
//  Moonshot
//
//  Created by Michael Danko on 10/5/24.
//

import SwiftUI

struct CustomView: View {
    
    let text: String
    
    var body: some View {
        Text("\(text)")
    }
    
    init(text: String) {
        print("Creating a new CustomText: \(text)")
        self.text = text
    }
}

//struct ScrollDetails: View {
//    var body: some View {
//        ScrollView() {
//            LazyVStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomView(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//        
//    }
//}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
}

struct User: Codable {
    let name: String
    let address: Address
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Button("Decode JSON") {
                print("Pushed the button")
                
                let input = """
                {
                    "name": "Michael Danko".
                    "address": {
                        "street": "123 Main Street",
                        "city": "Charlotte",
                        "state": "NC"
                    }
                }
                """
                print("\(input)")
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                
                
                do {
                    let user = try decoder.decode(User.self, from: data)
                    print("User is \(user.name)")
                    print("Lives at \(user.address.street)")
                } catch  {
                    print("Error trying to decode the user.")
                    print("\(error.localizedDescription)")
                }
                
//                if let user = try? decoder.decode(User.self, from: data) {
//                    print("trying to decode")
//                    print(user.address.street)
//                }
            
                
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
