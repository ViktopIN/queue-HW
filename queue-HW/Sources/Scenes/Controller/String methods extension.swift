//
//  String methods extension.swift
//  queue-HW
//
//  Created by Виктор on 31.07.2022.
//

extension String {
    mutating func replace(at index: Int, with character: Character) {
        var stringArray = Array(self)
        stringArray[index] = character
        self = String(stringArray)
    }
}
