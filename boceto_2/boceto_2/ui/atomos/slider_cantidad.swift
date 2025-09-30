//
//  slider_cantidad.swift
//  boceto_2
//
//  Created by alumno on 28/09/25.
//

import SwiftUI

struct slider_cantidad: View {
    @Binding var valor: Double
    var rango: ClosedRange<Double> = 1...5
    
    var body: some View {
        VStack {
            Text("Cantidad: \(Int(valor))")
            Slider(value: $valor, in: rango, step: 1)
                .padding(.horizontal)
        }
    }
}

#Preview {
    @Previewable @State var cantidad = 2.0
    slider_cantidad(valor: $cantidad)
}
