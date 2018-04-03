import UIKit

public class ScoreView: UIView {
    
    let titleLabel = UILabel()
    let scoreLabel = UILabel()
    
    public init() {
        super.init(frame: .zero)
        
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        
        scoreLabel.numberOfLines = 0
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        self.addSubview(titleLabel)
        self.addSubview(scoreLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scoreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: scoreLabel.leadingAnchor, constant: -20).isActive = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setContent(title: String, score: Int) {
        self.titleLabel.text = title
        self.scoreLabel.text = String(score)
    }
}
