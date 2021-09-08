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
    
    private let ngrokEndpoint           = "http://32e9adc7ae75.ngrok.io/api/quote"
    
    @Published var isRequestingQuote    : Bool      = false
    
    @Published var isDownloading        : Bool      = false
    @Published var downloadProgress     : Float     = 0
    @Published var pathToDownloadedFile : String    = ""
    @Published var downloadDidFail      : Bool      = false
    
    @Published var isPreviewing         : Bool      = false
    
    
    // MARK: - Init
    private override init() {}
    
    
    // MARK: - Methods
    public func setRequest() -> URLRequest? {
        guard let url = URL(string: ngrokEndpoint) else { return nil }
        
        var request = URLRequest(url: url)
        
        // --- HEADER CONFIG ---
        request.httpMethod = "GET"
        request.addValue("multipart/form-data", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    
    public func getQuote() {
        DispatchQueue.main.async {
            withAnimation {
                self.isRequestingQuote = true
                //isDownloading = true
                //downloadDidFail = false
            }
        }
        
        if let request = setRequest() {
            let downloadTask = urlSession.downloadTask(with: request)
            downloadTask.resume()
            
            self.downloadTask = downloadTask
        }
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
            if let response = downloadTask.response as? HTTPURLResponse {
                if (200...299).contains(response.statusCode) {
                    DispatchQueue.main.async {
                        self.isRequestingQuote = false
                        self.isDownloading = true // sure
                        self.downloadDidFail = false
                        
                        self.downloadProgress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
                    }
                }
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
            
            // retry --
            if let request = setRequest() {
                let downloadTask = urlSession.downloadTask(with: request)
                downloadTask.resume()
                
                self.downloadTask = downloadTask
            }
            
            return
        }
        
        do {
            let documentsURL = try FileManager.default.url(for: .documentDirectory,
                                                       in: .userDomainMask,
                                                       appropriateFor: nil,
                                                       create: false) as NSURL
            
            let savedURL = documentsURL.appendingPathComponent(location.lastPathComponent)?.deletingPathExtension().appendingPathExtension("pdf")
            try FileManager.default.moveItem(at: location, to: savedURL!)
            
            print("file successfully saved to: \(savedURL!)")
            DispatchQueue.main.async {
                self.pathToDownloadedFile = savedURL!.path
                self.isPreviewing = true
            }
        } catch {
            print("There was an error moving the file: \(error)")
        }
    }
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error { print("Completed with error: \(error)") }
        DispatchQueue.main.async {
            withAnimation {
                //self.isRequestingQuote = false
                self.isDownloading = false
                self.downloadProgress = 0
                self.downloadDidFail = true
            }
        }
    }
}
