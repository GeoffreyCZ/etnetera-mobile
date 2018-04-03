public protocol ScoreType {
    var title: String { get }
    var value: Int { get }
}

public class Score: ScoreType {
    public var title: String
    public var value: Int
    
    init(title: String, value: Int) {
        self.title = title
        self.value = value
    }
}
