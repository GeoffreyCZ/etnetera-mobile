import Foundation

class BusinessCardVM {
    var content: BusinessCard?
    
    private let dataProvider = RemoteDataProvider()
    
    func loadBusinessCard(for id: Int, completion: @escaping (BusinessCard?) -> Void) {
        dataProvider.loadPerson(id: id) { person in
            completion(person)
        }
    }
    
}























