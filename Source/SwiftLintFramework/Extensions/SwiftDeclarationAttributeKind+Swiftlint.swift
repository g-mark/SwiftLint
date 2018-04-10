//
//  SwiftDeclarationAttributeKind+Swiftlint.swift
//  SwiftLint
//
//  Created by Daniel.Metzing on 04/08/18.
//  Copyright © 2018 Realm. All rights reserved.
//

import SourceKittenFramework

public extension SwiftDeclarationAttributeKind {
    enum ModifierGroup: String, CustomDebugStringConvertible {
        case `override`
        case acl
        case setterACL
        case owned
        case mutators
        case final
        case typeMethods
        case `required`
        case `convenience`
        case `lazy`
        case `dynamic`
        case atPrefixed

        var swiftDeclarationAttributeKinds: Set<SwiftDeclarationAttributeKind> {
            switch self {
            case .acl:
                return [.private,
                        .fileprivate,
                        .internal,
                        .public,
                        .open]
            case .setterACL:
                return [.setterPrivate,
                        .setterFilePrivate,
                        .setterInternal,
                        .setterPublic,
                        .setterOpen
                        ]
            case .mutators:
                return [.mutating,
                        .nonmutating]
            case .override:
                return [.override]
            case .owned:
                return [.weak]
            case .final:
                return [.final]
            case .typeMethods:
                return []
            case .required:
                return [.required]
            case .convenience:
                return [.convenience]
            case .lazy:
                return [.lazy]
            case .dynamic:
                return [.dynamic]
            case .atPrefixed:
                return [.objc,
                        .nonobjc,
                        .objcMembers,
                        .ibaction,
                        .iboutlet,
                        .ibdesignable,
                        .ibinspectable,
                        .nsManaged,
                        .nsCopying]
            }
        }

        public var debugDescription: String {
            return self.rawValue
        }
    }
}
