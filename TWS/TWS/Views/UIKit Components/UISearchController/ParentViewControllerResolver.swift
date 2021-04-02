//
//  UIViewControllerResolver.swift
//  TWS
//
//  Created by Brian Tamsing on 3/30/21.
//

import SwiftUI

final class ParentViewControllerResolver: UIViewControllerRepresentable {
    // MARK: - Properties
    let onResolve: (UIViewController) -> Void

    // MARK: - Init
    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve
    }
    
    // MARK: - UIViewControllerRepresentable Methods
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController(onResolve: self.onResolve)
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // ...
    }
}

// MARK: -
final class ViewController: UIViewController {
    let onResolve: (UIViewController) -> Void
    
    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if let parent = parent { onResolve(parent) }
    }
}
