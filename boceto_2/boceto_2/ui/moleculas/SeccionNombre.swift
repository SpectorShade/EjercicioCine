//
//  SeccionNombre.swift
//  boceto_2
//
//  Created by alumno on 28/09/25.
//

import SwiftUI

struct SeccionNombre: View {
    @Binding var nombre: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tu nombre:")
            campo_texto(provisional: "Escribe tu nombre", texto: $nombre)
        }
        .padding(.vertical)
    }
}

#Preview {
    @Previewable @State var nombre = "Gael"
    SeccionNombre(nombre: $nombre)
        .padding()
}
