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

                Button("Confirmar") {
                    print("Cliente: \(nombre_cliente)")
                    print("Palomitas: \(quiere_palomitas ? "\(sabor_de_palomitas.rawValue) x\(Int(cantidad_palomitas))" : "No")")
                    print("Soda: \(quiere_soda ? "Sí" : "No")")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        } 
    }
}

#Preview {
    PantallaOpciones()
        .environment(ControladorBasico())
}

