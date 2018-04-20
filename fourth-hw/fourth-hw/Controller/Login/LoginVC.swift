import Foundation
import UIKit

class LoginVC: UIViewController {
    
    private lazy var loginButton = makeLoginButton()
    
    private func makeLoginButton() -> UIButton {
        let rVal = UIButton()
        rVal.setTitle("Přihlásit", for: .normal)
        rVal.backgroundColor = UIColor(named: "academy")
        rVal.layer.cornerRadius = 6
        rVal.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)
        rVal.addTarget(self, action: #selector(self.press), for: .touchUpInside)
        return rVal
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(loginButton)
        addConstraints()
    }
    
    private func addConstraints() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: loginButton.intrinsicContentSize.width + 2 * 30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: loginButton.intrinsicContentSize.height + 2 * 10).isActive = true
    }
    
    @objc private func press() {
        let vc = InputLoginVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

