//
//  Models.swift
//  Exercise
//
//  Created by Nguyễn Hoàng on 17/04/2022.
//

import Foundation

struct Employee {
    var id: String
    var name: String
    var createAt: String
    var avatar: String
    var address: String
    var isMale: Bool
    var status: String
    var dayWorking: Int
}

enum EmployeeLevel: CaseIterable {
    case fresher
    case junior
    case senior
    
    var title: String {
        switch self {
        case .fresher:
            return "Fresher"
        case .junior:
            return "Junior"
        case .senior:
            return "Senior"
        }
    }
    
    static func getEmployeeLevel(dayWorking: Int) -> EmployeeLevel {
        switch dayWorking {
        case 0..<200:
            return .fresher
        case 200..<400:
            return .junior
        default:
            return .senior
        }
    }
}

