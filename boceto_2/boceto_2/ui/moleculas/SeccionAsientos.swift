//
// SeccionAsientos.swift
// boceto_2
//
// Created by alumno on 29/09/25
//

import SwiftUI

struct SeccionAsientos: View {
    @State var estados: [[Bool]] = Array(
        repeating: Array(repeating: false, count: 4),
        count: 3
    )
    
    @State var asientoSeleccionado: (fila: Int, col: Int)? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Esquema de Asientos")
                .font(.headline)

          //Jarvis me explico este ForEach para la forma en que funcionaria esto del grid de asientos
            ForEach(estados.indices, id: \.self) { fila in
                HStack(spacing: 15) {
                    ForEach(estados[fila].indices, id: \.self) { columna in
                        asiento(
                            ocupado: $estados[fila][columna],
                            numero: "\(fila+1)-\(columna+1)"
                        )
                        .onTapGesture {
                            // Desmarcar asiento previo
                            if let previo = asientoSeleccionado {
                                estados[previo.fila][previo.col] = false
                            }
                            // Marcar el nuevo
                            estados[fila][columna] = true
                            asientoSeleccionado = (fila, columna)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    // El codigo de la silla o no si no se eligio
    func asientoSeleccionadoTexto() -> String {
        if let sel = asientoSeleccionado {
            return "Fila \(sel.fila+1), Columna \(sel.col+1)"
        } else {
            return "No seleccionado"
        }
    }
}

#Preview {
    SeccionAsientos()
}
