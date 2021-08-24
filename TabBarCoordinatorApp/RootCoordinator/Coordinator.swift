//
//  Coordinator.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    @discardableResult
    func start() -> UIViewController
}

