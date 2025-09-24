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
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Formulario para calcular la cantidad de palomitas")
                HStack{
                    Spacer()
                    Text("¿Quieres Palomitas?")
                    Spacer()
                    cajita_seleccion(checado: $quiere_palomitas, tamaño: 25)
                    Spacer()
                }
                if(quiere_palomitas){
                    HStack{
                        Text("¿Cual Sabor?")
                        HStack{
                            Picker(selection: $sabor_de_palomitas, label: Text("Sabor de Palomitas")) {
                                Text("Mantequilla").tag(SaboresPalomitas.Mantequilla)
                                Text("Naturales").tag(SaboresPalomitas.Natural)
                                Text("Cheddar").tag(SaboresPalomitas.QuesoCheddar)
                                Text("Doritos").tag(SaboresPalomitas.Doritos)
                                Text("Proteina").tag(SaboresPalomitas.Proteina)
                            }
                        }
                    }
                }
//                Text("Hola mundo el valor del slider es: \(valor_slider)")
//                Slider(value: $valor_slider, in: 0...100)
                
            }
        }
        
    }
}

#Preview {
    PantallaOpciones()
        .environment(ControladorBasico())
}

