//
//  asiento.swift
//  boceto_2
//
//  Created by alumno on 29/09/25.
//

import SwiftUI

struct asiento: View {
    @Binding var ocupado: Bool
    var numero: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 60, height: 60)
                .foregroundStyle(ocupado ? .red : .green)
                .overlay(
                    Text(ocupado ? "X" : "O")
                        .font(.title)
                        .foregroundStyle(.white)
                )
            
            Text("Asiento \(numero)")
                .font(.caption)
        }
        .onTapGesture {
            ocupado.toggle()
        }
    }
}

#Preview {
    @Previewable @State var estaOcupado: Bool = false
    asiento(ocupado: $estaOcupado, numero: "A1")
}
