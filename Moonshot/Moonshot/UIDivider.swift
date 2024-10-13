//
//  UIDivider.swift
//  Moonshot
//
//  Created by Michael Danko on 10/13/24.
//

import SwiftUI

struct UIDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 5)
            .foregroundStyle(Color.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    UIDivider()
}
