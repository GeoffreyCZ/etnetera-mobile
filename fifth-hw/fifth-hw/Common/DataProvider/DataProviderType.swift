import Foundation

protocol DataProviderType {
    func loadPersonList(completion: @escaping (_ personList: [Person]?) -> Void)
    func login(email: String, password: String, completion: @escaping (_ accountCredentials: AccountCredentials?) -> Void)
    func loadPerson(id: Int, completion: @escaping (_ person: BusinessCard?) -> Void)
}
