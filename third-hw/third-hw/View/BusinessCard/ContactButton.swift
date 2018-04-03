import UIKit

public class ContactButton: UIButton {
    
    public var callbackString: String!
    
    public func setContent(imageName: String, title: String, callbackString: String) {
        let image = UIImage(named: imageName)
        let width = image!.size.width
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.setTitleColor(UIColor.black, for: .normal)
        self.setTitleColor(UIColor.black.withAlphaComponent(0.3), for: .highlighted)
        self.heightAnchor.constraint(equalToConstant: width + 20).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.imageEdgeInsets = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: width, left: -width, bottom: 0, right: 0)
        
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        self.callbackString = callbackString
    }
    
}
