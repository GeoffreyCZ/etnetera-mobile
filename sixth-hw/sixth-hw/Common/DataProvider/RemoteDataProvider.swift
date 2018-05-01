import Foundation

class RemoteDataProvider: RemoteDataProviderType {
    
    func loadPerson(id: Int, completion: @escaping (BusinessCard?) -> Void) {
        let url = getUrl(for: .person, with: id)
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            let person = try? decoder.decode(BusinessCard.self, from: data!)
            DispatchQueue.main.sync {
                completion(person)
            }
        }
        session.resume()
    }
    
    func loadBusinessCard(id: Int, token: String, completion: @escaping (BusinessCard?) -> Void) {
        let url = getUrl(for: .account, with: id)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(token, forHTTPHeaderField: "AccessToken")
        
        let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let decoder = JSONDecoder()
            let person = try? decoder.decode(BusinessCard.self, from: data!)
            DispatchQueue.main.sync {
                completion(person)
            }
        }
        session.resume()
    }
    
    func login(email: String, password: String, completion: @escaping (AccountCredentials?) -> Void) {
        let url = getUrl(for: .login)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let login = Login(email, password)
        let encoder = JSONEncoder()
        let data = try? encoder.encode(login)
        
        urlRequest.httpBody = data
        
        let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let decoder = JSONDecoder()
            let accountCredentials = try? decoder.decode(AccountCredentials.self, from: data!)
            DispatchQueue.main.sync {
                completion(accountCredentials)
            }
        }
        session.resume()
    }
    
    func loadPersonList(completion: @escaping (_ personList: [Person]?) -> Void) {
        let url = getUrl(for: .personList)
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            let personList = try? decoder.decode([Person].self, from: data!)
            DispatchQueue.main.sync {
                completion(personList)
            }
        }
        session.resume()
    }
    
    
}
