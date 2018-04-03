import UIKit

class MainTabBarController: UITabBarController {
    
    private lazy var personListView = makePersonListView()
    private lazy var loginView = makeLoginView()
    
    private func makePersonListView() -> UINavigationController {
        let nc = UINavigationController(rootViewController: PersonListVC(viewModel: ViewModel()))
        nc.tabBarItem = UITabBarItem(title: "Seznam účastníků", image: UIImage(named: "ic-list"), selectedImage: UIImage(named: "ic-list"))
        return nc
    }
    
    private func makeLoginView() -> UINavigationController {
        
        if UserDefaults.standard.value(forKeyPath: "loggedUser") != nil {
            let nc = UINavigationController()
            nc.tabBarItem = UITabBarItem(title: "Účet", image: UIImage(named: "ic-account"), selectedImage: UIImage(named: "ic-account"))
            nc.setNavigationBarHidden(true, animated: true)
            let userId = UserDefaults.standard.value(forKey: "loggedUser") as! Int
            let content = MockDataProvider.shared.getBusinessCard(for: userId)
            let vc = BusinessCardVC(with: content)
            nc.viewControllers = [LoginVC(), vc]
            return nc
        } else {
            let nc = UINavigationController(rootViewController: LoginVC())
            nc.tabBarItem = UITabBarItem(title: "Účet", image: UIImage(named: "ic-account"), selectedImage: UIImage(named: "ic-account"))
            nc.setNavigationBarHidden(true, animated: true)
            return nc
        }
    }
    
    override func loadView() {
        super.loadView()
        viewControllers = [personListView, loginView]
        self.tabBar.tintColor = UIColor(named: "academy")
    }
    
}


