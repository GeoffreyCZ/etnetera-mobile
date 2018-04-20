import Foundation

enum Endpoint: String {
    case personList = "/api/participants?sort=asc"
    case login = "/api/login"
    case person = "/api/participant"
    case account = "/api/account"
}
