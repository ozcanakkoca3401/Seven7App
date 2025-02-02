//
//  EmptyValueRepresentable.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import Foundation

public protocol EmptyValueRepresentable {
    static var emptyValue: Self { get }
}

extension Array: EmptyValueRepresentable {
    public static var emptyValue: Array<Element> {
        return []
    }
}

extension Set: EmptyValueRepresentable {
    public static var emptyValue: Set<Element> {
        return []
    }
}

extension String: EmptyValueRepresentable {
    public static var emptyValue: String {
        ""
    }
    
    public static var oneSpaceValue: String {
        " "
    }
    
    public static var twoDotsValue: String {
        " : "
    }
}

extension Dictionary: EmptyValueRepresentable {
    public static var emptyValue: Dictionary {
        return [:]
    }
}
