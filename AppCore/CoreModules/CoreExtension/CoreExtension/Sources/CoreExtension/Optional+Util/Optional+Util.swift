//
//  Optional+Util.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import Foundation

extension Optional {
    
    public var isNil: Bool {
        switch self {
        case .some:
            return false
        case .none:
            return true
        }
    }
    
    public var isNotNil: Bool {
        return !isNil
    }
}

extension Optional where Wrapped: Collection {
    
    public var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

extension Optional where Wrapped == Int {
    
    public var orZero: Int {
        self.or(.zero)
    }
    
    func or(_ param: Int) -> Int {
        switch self {
        case .some(let value):
            return value
        case .none:
            return param
        }
    }
}

extension Optional where Wrapped == CGFloat {
    
    public var orZero: CGFloat {
        self.or(.zero)
    }
    
    func or(_ param: CGFloat) -> CGFloat {
        switch self {
        case .some(let value):
            return value
        case .none:
            return param
        }
    }
}

extension Optional where Wrapped == String {
    
    public var orEmpty: String {
        self.or(.emptyValue)
    }
    
    func or(_ param: String) -> String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return param
        }
    }
}

extension Optional where Wrapped == Array<Int> {
    
    public var orEmpty: [Int] {
        switch self {
        case .some(let value):
            return value
        case .none:
            return .emptyValue
        }
    }
}

extension Optional where Wrapped == Array<CGFloat> {
    
    public var orEmpty: [CGFloat] {
        switch self {
        case .some(let value):
            return value
        case .none:
            return .emptyValue
        }
    }
}

extension Optional where Wrapped == Array<String> {
    
    public var orEmpty: [String] {
        switch self {
        case .some(let value):
            return value
        case .none:
            return .emptyValue
        }
    }
}


