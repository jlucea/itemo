//
//  UrgentBadgeRepresentable.swift
//  Itemo
//
//  Created by Jaime Lucea on 23/4/25.
//

import SwiftUI

struct UrgentBadge: UIViewRepresentable {
    func makeUIView(context: Context) -> UrgentBadgeView {
        return UrgentBadgeView()
    }

    func updateUIView(_ uiView: UrgentBadgeView, context: Context) { }
}

#Preview {
    UrgentBadge()
        .frame(width: 100, height: 30)
}
