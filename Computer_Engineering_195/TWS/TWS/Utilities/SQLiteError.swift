//
//  SQLiteError.swift
//  TWS
//
//  Created by Brian Tamsing on 2/19/21.
//

import Foundation

enum SQLiteError: Error {
    case failedToOpen       (_ message: String)
    case failedToClose      (_ message: String)
    
    case invalidURL         (_ message: String = "The db url was invalid")
    case noOpenConnection   (_ message: String = "No open db connnection available for closing")
}
