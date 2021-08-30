//
//  NetworkMonitor.swift
//  TabBarCoordinatorApp
//
//  Created by Jakov Juric Juric on 29.08.2021..
//

import Foundation
import Network

final class NetworkMonitor {
    // MARK: - Properties
    private let monitor: NWPathMonitor
    private let queue: DispatchQueue
    
    var isConnected: Bool = false
    var isCellularNetwork: Bool = false
    
    // MARK: - Init
    init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue(label: "NetworkMonitorQueue")
        self.setupMonitor()
    }
    
    // MARK: - Setup
    private func setupMonitor() {
        monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                print("Network Monitor status: CONNECTED")
                self?.isConnected = true
            } else {
                print("Network Monitor status: DISCONNECTED")
                self?.isConnected = false
            }
            self?.isCellularNetwork = path.isExpensive
        }
        monitor.start(queue: queue)
    }
}
