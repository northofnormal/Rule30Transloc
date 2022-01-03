//
//  ContentView.swift
//  Rule30Transloc
//
//  Created by Anne Cahalan on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var patternRows = [[Int]]()
    @State private var sizeOfPattern = 3

    let implementor = Implementer()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("How large should our pattern be?")
                    Picker(selection: $sizeOfPattern) {
                        ForEach(3..<25) {
                            Text("\($0)")
                        }
                    } label: {
                        Text("picker")
                    }
                }

                ForEach(patternRows, id: \.self) { row in
                    HStack(spacing: 0) {
                        Spacer()

                        ForEach(row, id: \.self) { item in
                            Color(item == 0 ? .white : .black)
                                .border(Color.black)
                        }

                        Spacer()
                    }
                }

                Spacer()

                Button("Rule 30 GO!") {
                    patternRows = implementor.rule30ify(sizeOfPattern + 3)
                }
                .frame(width: 200, height: 50)
                .background(.purple)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            }
            .navigationTitle("Rule 30")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
