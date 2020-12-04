import Foundation

class Client: Identifiable, CustomStringConvertible, Hashable {
    var description: String = ""
    
    var info: [String : String]
    var id = NSUUID().uuidString
    
    init(info: [String : String]) {
        self.info = info
        for (key, value) in info {
            description += "\(key): \(value); "
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Client, rhs: Client) -> Bool {
        return lhs.id == rhs.id
    }
    
}
