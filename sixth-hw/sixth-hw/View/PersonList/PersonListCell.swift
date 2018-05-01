import UIKit
import Kingfisher

class PersonListCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(named: "academy")?.withAlphaComponent(0.3)
        selectedBackgroundView = backgroundView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViewsAndlayout() {
        self.accessoryType = .disclosureIndicator
        
        contentView.addSubview(detailTextLabel!)
        contentView.addSubview(imageView!)
        contentView.addSubview(textLabel!)
    }
    
    func setupCell(with personList: [Person]) {
        for person in personList {
            self.textLabel?.text = person.name
            
            guard let imageUrl = person.imageUrl else { return }
            let url = URL(string: imageUrl)
            self.imageView?.kf.setImage(with: url, completionHandler: { [weak self] (_, _, _, _) in
                self?.setNeedsLayout()
            })
            
            self.detailTextLabel?.attributedText = person.getTopScores().reduce(NSMutableAttributedString()) { (result, nextVal) in
                result.append(NSAttributedString(string: nextVal.emoji, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 24)]))
                result.append(NSAttributedString(string: " \(nextVal.value)   ", attributes: [
                    NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13),
                    NSAttributedStringKey.baselineOffset: 2,
                    NSAttributedStringKey.foregroundColor: UIColor.gray
                    ]))
                return result
            }
        }
    }
}
