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
        let view = UINavigationController(rootViewController: LoginVC())
        view.tabBarItem = UITabBarItem(title: "Účet", image: UIImage(named: "ic-account"), selectedImage: UIImage(named: "ic-account"))
        view.setNavigationBarHidden(true, animated: true)
        return view
    }
    
    override func loadView() {
        super.loadView()
        viewControllers = [personListView, loginView]
        self.tabBar.tintColor = UIColor(named: "academy")
    }
}
