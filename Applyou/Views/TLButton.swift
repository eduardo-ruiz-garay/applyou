//
//  TLButton.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", backgroundColor: .pink) {
        
    }
}
