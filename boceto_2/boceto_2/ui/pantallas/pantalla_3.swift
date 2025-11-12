//
//  pantalla_3.swift
//  boceto_2
//
//  Created by Jadzia Gallegos on 22/09/25.
//

import SwiftUI

enum SaboresPalomitas: String, CaseIterable, Identifiable{
    case Mantequilla
    case Natural
    case QuesoCheddar
    case Doritos
    case Proteina
    
    var id: Self { self }
}

struct PantallaOpciones: View {
    @State var quiere_palomitas: Bool = false
    @State var sabor_de_palomitas: SaboresPalomitas = .Mantequilla
    @State var cantidad_palomitas: Double = 1
    @State var quiere_soda = false
    @State var nombre_cliente = ""
    @State var estadosAsientos: [[Bool]] = Array(repeating: Array(repeating: false, count: 4), count: 3)
    @State var asientoSeleccionado: (fila: Int, col: Int)? = nil
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Formulario de Cinemexipolis")
                    .font(.headline)    

                SeccionNombre(nombre: $nombre_cliente)
                
                SeccionPalomitas(
                    quiere: $quiere_palomitas,
                    sabor: $sabor_de_palomitas,
                    cantidad: $cantidad_palomitas
                )
                
                SeccionSoda(quiere: $quiere_soda)

                SeccionAsientos(
                    estados: $estadosAsientos,
                    asientoSeleccionado: $asientoSeleccionado
                )

                Button("Confirmar") {
                    print("Cliente: \(nombre_cliente)")
                    print("Palomitas: \(quiere_palomitas ? "\(sabor_de_palomitas.rawValue) x\(Int(cantidad_palomitas))" : "No")")
                    print("Soda: \(quiere_soda ? "Sí" : "No")")
                    if let sel = asientoSeleccionado {
                        print("Asiento: Fila \(sel.fila+1), Columna \(sel.col+1)")
                    } else {
                        print("Asiento: No seleccionado")
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer(minLength: 80)
            }
            .padding()
        } 
    }
}

#Preview {
    PantallaOpciones()
        .environment(ControladorBasico())
}

