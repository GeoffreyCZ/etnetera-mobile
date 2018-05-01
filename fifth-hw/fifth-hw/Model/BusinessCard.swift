import Foundation

public class BusinessCard: Decodable {
    let id: Int
    let name: String
    let icon: String
    let slack_id: String
    let email: String
    let phone: String
    let position: String
    let scores: [ScoreDetail]
    
    init(id: Int, name: String, icon: String, slack_id: String, email: String, phone:String, position: String, scores: [ScoreDetail]) {
        self.id = id
        self.name = name
        self.icon = icon
        self.slack_id = slack_id
        self.email = email
        self.phone = phone
        self.position = phone
        self.scores = scores
    }
}
