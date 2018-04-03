import UIKit

class InputLoginVC: UIViewController, UITextFieldDelegate {
    private lazy var usernameInput = makeUsernameTextField()
    private lazy var passwordInput = makePasswordTextField()
    private lazy var loginButton = makeLoginButton()
    
    private func makeUsernameTextField() -> UITextField {
        let rVal = UITextField()
        rVal.placeholder = "Vlož přihlašovací jméno"
        rVal.textAlignment = .center
        rVal.tintColor = UIColor(named: "academy")
        rVal.borderStyle = .roundedRect
        rVal.keyboardType = .asciiCapable
        rVal.returnKeyType = .next
        rVal.tag = 0
        rVal.delegate = self
        return rVal
    }
    
    private func makePasswordTextField() -> UITextField {
        let rVal = UITextField()
        rVal.placeholder = "Heslo"
        rVal.textAlignment = .center
        rVal.tintColor = UIColor(named: "academy")
        rVal.borderStyle = .roundedRect
        rVal.keyboardType = .asciiCapable
        rVal.returnKeyType = .go
        rVal.isSecureTextEntry = true
        rVal.tag = 1
        rVal.delegate = self
        return rVal
    }
    
    private func makeLoginButton() -> UIButton {
        let rVal = UIButton()
        rVal.setTitle("Přihlásit", for: .normal)
        rVal.backgroundColor = UIColor(named: "academy")
        rVal.layer.cornerRadius = 6
        rVal.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)
        rVal.addTarget(self, action: #selector(self.press), for: .touchUpInside)
        return rVal
    }
    
    @objc private func press() {
        authenticate()
    }
    
    private func authenticate() {
        MockDataProvider.shared.getStudents().forEach {
            if ($0.name == usernameInput.text && passwordInput.text != "") {
                UserDefaults.standard.set($0.id, forKey: "loggedUser")
                showBusinessCard(id: $0.id)
                return
            }
        }
    }
    
    private func showBusinessCard(id: Int) {
        let content = MockDataProvider.shared.getBusinessCard(for: id)
        let vc = BusinessCardVC(with: content)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField === usernameInput) {
            usernameInput.resignFirstResponder()
            passwordInput.becomeFirstResponder()
        }
        if (textField === passwordInput) {
            passwordInput.resignFirstResponder()
            authenticate()
        }
        return true
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(usernameInput)
        view.addSubview(passwordInput)
        view.addSubview(loginButton)
        usernameInput.becomeFirstResponder()
        addConstraints()
    }
    
    private func addConstraints() {
        usernameInput.translatesAutoresizingMaskIntoConstraints = false
        usernameInput.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameInput.bottomAnchor.constraint(equalTo: passwordInput.topAnchor, constant: -10).isActive = true
        usernameInput.widthAnchor.constraint(equalTo: view.readableContentGuide.widthAnchor).isActive = true
        usernameInput.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordInput.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        passwordInput.widthAnchor.constraint(equalTo: view.readableContentGuide.widthAnchor).isActive = true
        passwordInput.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 10).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: loginButton.intrinsicContentSize.width + 2 * 30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: loginButton.intrinsicContentSize.height + 2 * 10).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}



























