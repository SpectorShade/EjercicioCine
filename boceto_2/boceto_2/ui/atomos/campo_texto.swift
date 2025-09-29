//
//  campo_texto.swift
//  boceto_2
//
//  Created by alumno on 28/09/25.
//

import SwiftUI

struct campo_texto: View {
    var provisional: String
    @Binding var texto: String
    
    var body: some View {
        TextField(provisional, text: $texto)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var nombre = ""
    campo_texto(provisional: "Escribe tu nombre", texto: $nombre)
}
