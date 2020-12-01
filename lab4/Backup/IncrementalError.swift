import Foundation

enum IncrementalError: Error {
    case BackupIsEmpty(message: String = "Backup is empty. Incremental restore point needs at least one another restore point")
}
