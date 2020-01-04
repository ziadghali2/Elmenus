//
//  File.swift
//  Pods
//
//  Created by Ziad Ghali on 9/10/19.
//

import RealmSwift

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            beginWrite()
            try block()
            try commitWrite()
        } else {
            try write(block)
        }
    }
}
