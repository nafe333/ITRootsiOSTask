//
//  NetworkMonitor.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    private(set) var isConnected: Bool = false
    private var isMonitoring = false
    private var listeners: [(Bool) -> Void] = []

    private init() {}

    func startMonitoring() {
        guard !isMonitoring else { return }
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            let status = path.status == .satisfied
            self.isConnected = status
            self.listeners.forEach { $0(status) }
        }
        monitor.start(queue: queue)
        isMonitoring = true
    }

    func stopMonitoring() {
        guard isMonitoring else { return }
        monitor.cancel()
        isMonitoring = false
        listeners.removeAll()
    }

    func checkConnection(completion: @escaping (Bool) -> Void) {
        listeners.append(completion)
        completion(isConnected)
    }
}
