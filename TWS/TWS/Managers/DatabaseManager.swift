//
//  DatabaseManager.swift
//  TWS
//
//  Created by Brian Tamsing on 2/19/21.
//

import Foundation
import SQLite3

///
/// Manages connections to a SQLite Database.
///
class DatabaseManager {
    // MARK: - Properties
    private var db: OpaquePointer?
    private var errorMessage: String {
        if let error = sqlite3_errmsg(self.db) {
            return String(cString: error)
        } else {
            return "No error message was provided by SQLite"
        }
    }
    
    
    // MARK: - Init
    init(dbPath: String) {
        do {
            try openConnection(dbPath: dbPath)
        } catch {
            print(error) // for debugging purposes only
        }
        // check if the db is nil at the call site
    }
    
    
    // MARK: - Methods
    func openConnection(dbPath: String) throws {
        guard let dbURL = try? FileManager.default.url(for: .documentDirectory,
                                                       in: .userDomainMask,
                                                       appropriateFor: nil,
                                                       create: false).appendingPathComponent(dbPath) else {
            throw SQLiteError.invalidURL()
        }
        
        if sqlite3_open(dbURL.path, &self.db) == SQLITE_OK {
            print("db connection opened")
        } else {
            throw SQLiteError.failedToOpen(errorMessage)
        }
    }
    
    func closeConnection() throws {
        guard self.db != nil else {
            throw SQLiteError.noOpenConnection()
        }
        
        if sqlite3_close(self.db) == SQLITE_OK {
            print("db connection closed")
        } else {
            throw SQLiteError.failedToClose(errorMessage)
        }
    }
}
