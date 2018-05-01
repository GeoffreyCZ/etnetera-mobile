import UIKit

class BusinessCardView: UIScrollView {
    private let gray = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    private let imageWidthAndHeight: CGFloat = 150
    private let mainStackView = UIStackView()
    
    var content: BusinessCard? {
        didSet {
            if let bussinessCard = content {
                setupContent(content: bussinessCard)
            }
        }
    }
    
    @objc func handleButtonPress(_ sender: ContactButton) {
        print(sender.callbackString)
    }
    
    func setupContent(content: BusinessCard) -> Void {
        
        // MARK: - Main stack view setup
        
        self.addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        mainStackView.alignment = .center
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.spacing = 25
        
        createHeader()
        createContactButtons()
        createPosition()
        createSeparator()
        createScores()
    }
    
    // MARK: - Header section setup
    
    private func createHeader() {
        let avatarImageView = UIImageView(image: UIImage(named: content!.icon + "-large"))
        mainStackView.addArrangedSubview(avatarImageView)
        
        avatarImageView.layer.borderWidth = 1
        avatarImageView.layer.borderColor = self.gray.cgColor
        avatarImageView.layer.cornerRadius = self.imageWidthAndHeight / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.heightAnchor.constraint(equalToConstant: self.imageWidthAndHeight).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: self.imageWidthAndHeight).isActive = true
        
        let nameLabel = UILabel()
        mainStackView.addArrangedSubview(nameLabel)
        
        nameLabel.text = content!.name
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 25)
    }
    
    // MARK: - Contact section setup
    
    private func createContactButtons() {
        let contactStackView = UIStackView()
        mainStackView.addArrangedSubview(contactStackView)
        
        contactStackView.axis = .horizontal
        contactStackView.alignment = .center
        contactStackView.distribution = .fill
        contactStackView.spacing = 50
        
        let slackButton = ContactButton()
        contactStackView.addArrangedSubview(slackButton)
        
        slackButton.setContent(imageName: "ic-slack", title: "Slack", callbackString: "Opening Slack app with prepicked conversation with user ID \(content!.slack_id).")
        slackButton.addTarget(self, action: #selector(self.handleButtonPress(_:)), for: .touchUpInside)
        
        let emailButton = ContactButton()
        contactStackView.addArrangedSubview(emailButton)
        
        emailButton.setContent(imageName: "ic-email", title: "E-mail", callbackString: "Opening Mail app with \(content!.email) as recipient.")
        emailButton.addTarget(self, action: #selector(self.handleButtonPress(_:)), for: .touchUpInside)
        
        let phoneButton = ContactButton()
        contactStackView.addArrangedSubview(phoneButton)
        
        phoneButton.setContent(imageName: "ic-phone", title: "Phone", callbackString: "Dialing number \(content!.phone).")
        phoneButton.addTarget(self, action: #selector(self.handleButtonPress(_:)), for: .touchUpInside)
    }
    
    // MARK: - Position section setup
    
    private func createPosition() {
        let positionLabel = UILabel()
        mainStackView.addArrangedSubview(positionLabel)
        
        positionLabel.text = content!.position
        positionLabel.textAlignment = .center
        positionLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    // MARK: - Separator
    
    private func createSeparator() {
        let separatorView = UIView()
        mainStackView.addArrangedSubview(separatorView)
        
        separatorView.backgroundColor = self.gray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        separatorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // MARK: - Scores section setup
    
    private func createScores() {
        self.content!.scores.forEach{ score in
            let scoreView = ScoreView()
            mainStackView.addArrangedSubview(scoreView)
            
            scoreView.setContent(emoji: score.emoji, score: score.value)
            scoreView.translatesAutoresizingMaskIntoConstraints = false
            scoreView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30).isActive = true
            scoreView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30).isActive = true
        }
    }
}
