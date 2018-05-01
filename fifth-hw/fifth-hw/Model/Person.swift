import Foundation

public class Person: Decodable {
    public var id: Int
    public var name: String
    public var icon: String
    public var scores: [Score]
    
    init(id: Int, name: String, icon: String, scores: [Score]) {
        self.id = id
        self.name = name
        self.icon = icon
        self.scores = scores
    }
    
    func getTopScores() -> [Score] {
        let descSortedScores = scores.sorted {
            $0.value > $1.value
        }
        return Array(descSortedScores.prefix(Config.maxNumberOfScores))
    }
}

