//
// SeccionAsientos.swift
// boceto_2
//
// Created by alumno on 29/09/25
//

import SwiftUI

struct SeccionAsientos: View {
    @Binding var estados: [[Bool]]
    @Binding var asientoSeleccionado: (fila: Int, col: Int)?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Esquema de Asientos")
                .font(.headline)

            ForEach(estados.indices, id: \.self) { fila in
                HStack(spacing: 15) {
                    ForEach(estados[fila].indices, id: \.self) { columna in
                        asiento(
                            ocupado: $estados[fila][columna],
                            numero: "\(fila+1)-\(columna+1)"
                        )
                        .onTapGesture {
                            if let previo = asientoSeleccionado {
                                estados[previo.fila][previo.col] = false
                            }
                            estados[fila][columna] = true
                            asientoSeleccionado = (fila, columna)
                        }
                    }
                }
            }
        }
        .padding()
    }

    func asientoSeleccionadoTexto() -> String {
        if let sel = asientoSeleccionado {
            return "Fila \(sel.fila+1), Columna \(sel.col+1)"
        } else {
            return "No seleccionado"
        }
    }
}


#Preview {
    @Previewable @State var estadosPrevisualizar: [[Bool]] = Array(
        repeating: Array(repeating: false, count: 4),
        count: 3
    )
    @Previewable @State var asientoSel: (fila: Int, col: Int)? = nil

    return SeccionAsientos(
        estados: $estadosPrevisualizar,
        asientoSeleccionado: $asientoSel
    )
    .padding()
}
