//
//  Coordinatable.swift
//  MolniaCleanTemplate
//
//  Created by Ляпин Михаил on 06.12.2023.
//

import Foundation

protocol Coordinatable: AnyObject {
    associatedtype CoordinatorType: Coordinator
    var coordinator: CoordinatorType? { get set }
}
