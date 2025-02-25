import Foundation

enum MonsterError: Error {
    case missingData
}

extension MonsterError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard a monster missing invalid data",
                comment: ""
            )
        }
    }
}
