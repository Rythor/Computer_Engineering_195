//
//  DownloadManager.swift
//  TWS
//
//  Created by Brian Tamsing on 5/6/21.
//

import SwiftUI

final class DownloadManager: NSObject, ObservableObject {
    // MARK: - Properties
    static let shared                   = DownloadManager()
    
    private lazy var urlSession         = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    private var downloadTask            : URLSessionDownloadTask?
    
    private let ngrokEndpoint           = "http://bf396d1caadb.ngrok.io/api/quote"
    
    @Published var isDownloading        : Bool      = false
    @Published var downloadProgress     : Float     = 0
    
    @Published var isPreviewing         : Bool      = false // will edit this later
    @Published var pathToDownloadedFile : String    = ""
    
    // MARK: - Init
    private override init() {}
    
    // MARK: - Methods
    public func downloadQuote() {
        withAnimation { isDownloading = true }
        guard let url = URL(string: ngrokEndpoint) else { return }
        
        var request = URLRequest(url: url)
        
        // --- HEADER CONFIG ---
        request.httpMethod = "GET"
        request.addValue("multipart/form-data", forHTTPHeaderField: "Accept")
        
        let downloadTask = urlSession.downloadTask(with: request)
        downloadTask.resume()
        
        self.downloadTask = downloadTask
    }
}

// MARK: - Extension
extension DownloadManager: URLSessionDelegate, URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64
    ){
        if downloadTask == self.downloadTask {
            DispatchQueue.main.async {
                self.downloadProgress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            }
        }
    }
    
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL
    ){
        DispatchQueue.main.async {
            withAnimation {
                self.isDownloading = false
                self.downloadProgress = 0
            }
        }
        guard let response = downloadTask.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print("bad response")
            return
        }
        
        do {
            let documentsURL = try FileManager.default.url(for: .documentDirectory,
                                                       in: .userDomainMask,
                                                       appropriateFor: nil,
                                                       create: false) as NSURL
            let savedURL = documentsURL.appendingPathComponent(response.suggestedFilename!)!//.deletingPathExtension().appendingPathExtension("pdf")
            try FileManager.default.moveItem(at: location, to: savedURL) // file must be moved/copied to persist past end of callback
            
            print("file successfully saved to: \(savedURL)")
            DispatchQueue.main.async { self.pathToDownloadedFile = savedURL.path; self.isPreviewing = true }
        } catch {
            print("There was an error moving the file: \(error)")
        }
    }
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error { print("Completed with error: \(error)") }
    }
}
