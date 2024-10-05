import Foundation
import UIKit

extension String {
    
    func localized(bundle: Bundle = .main, 
                   tableName: String = LocalizableFiles.generalPurpose.filename) -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}

enum LocalizableFiles {
    case generalPurpose
    var filename: String {
        switch self {
        case .generalPurpose: return "LocalizableMessage"
        }
    }
}
