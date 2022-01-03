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
                    rule30ify(sizeOfPattern + 3)
                }
                .frame(width: 200, height: 50)
                .background(.purple)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            }
            .navigationTitle("Rule 30")
        }
    }

    func rule30ify(_ maxSize: Int) {
        guard let middle = findMiddle(maxSize) else { return }

        var startingArray = [Int]()
        startingArray.append(contentsOf: repeatElement(0, count: maxSize))

        for location in middle {
            startingArray[location] = 1
        }

        patternRows = newRule30Array(from: startingArray)
    }

    func findMiddle(_ size: Int) -> [Int]? {
        let half = size/2

        if size % 2 == 0 {
            return [half - 1, half, half + 1]
        } else {
            return [half]
        }
    }

    func newRule30Array(from starter: [Int]) -> [[Int]] {
        var totalResult = [[Int]]()
        totalResult.append(starter)
        var newTranslatedArray = translate(starter)
        totalResult.append(newTranslatedArray)

        for _ in 1...starter.count - 1  {
            newTranslatedArray = translate(newTranslatedArray)
            totalResult.append(newTranslatedArray)
        }

        return totalResult
    }

    func translate(_ array: [Int]) -> [Int] {
        var result = [Int]()
        var previous = 0
        var following = 0

        for (index, item) in array.enumerated() {

            if index == 0 {
                previous = determineValue(from: [0, 0, item])
            } else {
                previous = array[index - 1]
            }

            if index == array.count - 1 {
                following = determineValue(from: [item, 0, 0])
            } else {
                following = array[index + 1]
            }

            let newArray = [previous, item, following]
            result.append(determineValue(from: newArray))
        }

        return result
    }

    func determineValue(from array:[Int]) -> Int {
        if array == [1,1,1] || array == [1,1,0] || array == [1,0,1] || array == [0,0,0] {
            return 0
        }

        if array == [1,0,0] || array == [0,1,0] || array == [0,1,1] || array == [0,0,1] {
            return 1
        }

        return 3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
