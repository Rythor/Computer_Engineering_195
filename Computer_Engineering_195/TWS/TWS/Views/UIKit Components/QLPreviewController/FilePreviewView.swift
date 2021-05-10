//
//  FilePreviewView.swift
//  TWS
//
//  Created by Brian Tamsing on 5/5/21.
//

import SwiftUI
import QuickLook

struct FilePreviewView: UIViewControllerRepresentable {
    // MARK: - Properties
    var filePath: String
    @Binding var isPreviewing: Bool
    
    
    // MARK: - UIViewControllerRepresentable Methods
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let previewController           = QLPreviewController()
        previewController.delegate      = context.coordinator
        previewController.dataSource    = context.coordinator
        
        let navController                       = UINavigationController(rootViewController: previewController)
        navController.navigationBar.tintColor   = UIColor.twsBlue
        
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // ...
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(filePreviewView: self)
    }
    
    // MARK: - Coordinator
    
    final class Coordinator: NSObject, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
        private let filePreviewView: FilePreviewView
        
        init(filePreviewView: FilePreviewView) {
            self.filePreviewView = filePreviewView
        }
        
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return NSURL(fileURLWithPath: filePreviewView.filePath) as QLPreviewItem
        }
        
        func previewControllerDidDismiss(_ controller: QLPreviewController) {
            filePreviewView.isPreviewing = false
        }
    }
}
