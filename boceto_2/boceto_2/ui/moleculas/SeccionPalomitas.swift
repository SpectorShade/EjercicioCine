//
//  SeccionPalomitas.swift
//  boceto_2
//
//  Created by alumno on 28/09/25.
//

import SwiftUI

struct SeccionPalomitas: View {
    @Binding var quiere: Bool
    @Binding var sabor: SaboresPalomitas
    @Binding var cantidad: Double
    
    var body: some View {
        VStack {
            HStack {
                Text("¿Quieres palomitas?")
                Spacer()
                cajita_seleccion(checado: $quiere, tamaño: 25)
            }
            
            if quiere {
                Picker("Sabor", selection: $sabor) {
                    ForEach(SaboresPalomitas.allCases) { sabor in
                        Text(sabor.rawValue).tag(sabor)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                slider_cantidad(valor: $cantidad)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    @Previewable @State var quiere = true
    @Previewable @State var sabor: SaboresPalomitas = .QuesoCheddar
    @Previewable @State var cantidad: Double = 2

    return SeccionPalomitas(
        quiere: $quiere,
        sabor: $sabor,
        cantidad: $cantidad
    )
    .padding()
}
