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

enum EmployeeRanks: CaseIterable {
    case Fresher
    case Junior
    case Senior
    
    var title: String {
        switch self {
        case.Fresher:
            return "Fresher"
        case .Junior:
            return "Junior"
        case .Senior:
            return "Senior"
        }
    }
//    var salary: Int {
//        switch self {
//        case .Fresher:
//            return 1000
//        case .Junior:
//            return 1500
//        case .Senior:
//            return 2000
//        }
//    }
    
    static func getEmployeeRanks(dayWorking: Int) -> EmployeeRanks {
        switch dayWorking {
        case 0..<200:
            return .Fresher
        case 200..<400:
            return .Junior
        default:
            return .Senior
        }
    }
}
