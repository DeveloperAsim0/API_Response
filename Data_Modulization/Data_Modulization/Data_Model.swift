//
//  Data_Model.swift
//  Data_Modulization
//
//  Created by Tarun Meena on 11/03/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import Foundation
import UIKit

struct Characters: Codable {
    let info: Info
    let results: [Result]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next:String
    let prev:String

}

struct Result: Codable {
    let name, status, species, gender: String
}
