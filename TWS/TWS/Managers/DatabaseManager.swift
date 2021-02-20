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
    var db: OpaquePointer?
    var errorMessage: String {
        if let err = sqlite3_errmsg(self.db) {
            let message = String(cString: err)
            return message
        } else {
            return "No error message was provided by SQLite"
        }
    }
    
    
    // MARK: - Init
    init(dbPath: String) {
        do {
            self.db = try openConnection(dbPath: dbPath)
        } catch {
            print(error) // for debugging purposes only
        }
        // check if the db is nil at the call site
    }
    
    
    // MARK: - Methods
    func openConnection(dbPath: String) throws -> OpaquePointer? {
        var db: OpaquePointer?
        
        guard let dbURL = try? FileManager.default.url(for: .documentDirectory,
                                                       in: .userDomainMask,
                                                       appropriateFor: nil,
                                                       create: false).appendingPathComponent(dbPath) else {
            throw SQLiteError.invalidURL()
        }
        
        if sqlite3_open(dbURL.path, &db) == SQLITE_OK {
            print("db connection opened")
        } else {
            if let errormsg = sqlite3_errmsg(db) {
                throw SQLiteError.failedToOpen(String(cString: errormsg))
            }
        }
        
        return db
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
