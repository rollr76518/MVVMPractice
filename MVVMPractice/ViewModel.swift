//
//  ViewModel.swift
//  MVVMPractice
//
//  Created by Hanyu on 2019/7/3.
//  Copyright © 2019 Hanyu. All rights reserved.
//

import Foundation

enum InputViewType {
    case `nil`
    case datePicker
    case picker
}

struct ViewModel {
    
    func inputViewType(indexPath: IndexPath) -> InputViewType {
        switch indexPath.row {
        case 0:
            return .picker
        case 1:
            return .datePicker
        default:
            return .nil
        }
    }
}
