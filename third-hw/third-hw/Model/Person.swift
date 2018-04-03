public protocol PersonType {
    var id: Int { get }
    var name: String { get }
    var icon: String { get }
    var scores: [ScoreType] { get }
}

extension PersonType {
    func getTopScores() -> [ScoreType] {
        let descSortedScores = scores.sorted {
            $0.value > $1.value
        }
        return Array(descSortedScores.prefix(Config.maxNumberOfScores))
    }
}

public class Person: PersonType {
    public var id: Int
    public var name: String
    public var icon: String
    public var scores: [ScoreType]
    
    init(id: Int, name: String, icon: String, scores: [ScoreType]) {
        self.id = id
        self.name = name
        self.icon = icon
        self.scores = scores
    }
}

