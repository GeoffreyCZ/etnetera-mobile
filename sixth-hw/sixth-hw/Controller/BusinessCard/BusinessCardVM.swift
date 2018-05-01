import UIKit

class BusinessCardVC: UIViewController {
    private let businessCardV = BusinessCardView()
    
    init(with content: BusinessCard) {
        businessCardV.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(businessCardV)
        businessCardV.frame = view.bounds
        businessCardV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .white
    }
}
