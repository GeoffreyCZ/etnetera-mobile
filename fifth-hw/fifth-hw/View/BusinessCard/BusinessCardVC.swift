import UIKit

class BusinessCardVC: UIViewController {
    private let businessCardV: BusinessCardView
    private let businessCardVM: BusinessCardVM
    
    init(with content: BusinessCard) {
        businessCardV = BusinessCardView()
        businessCardV.content = content
        businessCardVM = BusinessCardVM()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    init(id: Int) {
        businessCardV = BusinessCardView()
        businessCardVM = BusinessCardVM()
        super.init(nibName: nil, bundle: nil)
        businessCardVM.loadBusinessCard(for: id) { [weak self] content in
            self?.businessCardV.content = content
        }
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
