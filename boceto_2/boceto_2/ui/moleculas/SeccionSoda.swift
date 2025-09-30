//
//  SeccionSoda.swift
//  boceto_2
//
//  Created by alumno on 28/09/25.
//

import SwiftUI

struct SeccionSoda: View {
    @Binding var quiere: Bool
    
    var body: some View {
        Toggle("¿Quieres soda?", isOn: $quiere)
            .padding(.vertical)
    }
}

#Preview {
    @Previewable @State var quiere = false
    SeccionSoda(quiere: $quiere)
        .padding()
}
