import Foundation
import RealmSwift

final public class RealmManager {
    
    public static let shared: RealmManager = .init()
    public let realm = try! Realm()
    
    private init() {}
    
    public func objects<T: Object>(_ type: T.Type) -> Results<T> {
        realm.objects(type)
    }
    
    public func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
