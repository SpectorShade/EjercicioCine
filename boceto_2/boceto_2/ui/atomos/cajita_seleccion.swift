//
//  cajita_seleccion.swift
//  boceto_2
//
//  Created by alumno on 24/09/25.
//

import SwiftUI

struct cajita_seleccion: View {
    @Binding var checado: Bool
    var tamaño: CGFloat = 40
    
    var body: some View {
        ZStack{
            
        Rectangle()
            .frame(width: tamaño, height: tamaño)
            .cornerRadius(5)
            .foregroundStyle((checado ? .blue: .gray))
        Image(systemName: "checkmark.seal")
                .resizable()
                .scaledToFit()
                .frame(width: tamaño - (tamaño * 0.20))
                .foregroundStyle((checado ? .white: .gray))
        }
        .onTapGesture {
            checado.toggle()
        }
    }
}

#Preview {
    @Previewable @State var esta_checado: Bool = true
    cajita_seleccion(checado: $esta_checado)
}
