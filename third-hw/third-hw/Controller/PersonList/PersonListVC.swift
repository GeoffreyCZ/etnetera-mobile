import UIKit

class PersonListVC: UIViewController {
    let viewModel: ViewModel
    let tableView: UITableView = UITableView()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.indexPathsForSelectedRows?.forEach {
            tableView.deselectRow(at: $0, animated: true)
        }
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.register(PersonListCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Seznam účastníků"
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.didUpdateModel = { [weak self] model in
            self?.tableView.reloadData()
        }
        self.viewModel.loadContent()
    }
}

extension PersonListVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.modelForSection(section).header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return viewModel.modelForSection(section).footer
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let scores = viewModel.modelForRow(inSection: indexPath.section, atIdx: indexPath.row).getTopScores()
        
        let detail = NSMutableAttributedString(string: "")
        
        for i in scores {
            detail.append(NSAttributedString(string: i.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]))
            detail.append(NSAttributedString(string: " " + String(i.value) + "   ", attributes: [NSAttributedStringKey.foregroundColor: UIColor.gray ]))
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PersonListCell
        
        cell.textLabel?.text = viewModel.modelForRow(inSection: indexPath.section, atIdx: indexPath.row).name
        cell.detailTextLabel?.attributedText = detail
        cell.detailTextLabel?.textColor = UIColor(red: 180.0/255.0, green: 180.0/255.0, blue: 180.0/255.0, alpha: 1.0)
        cell.imageView?.image = UIImage(named: viewModel.modelForRow(inSection: indexPath.section, atIdx: indexPath.row).icon)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = viewModel.modelForRow(inSection: indexPath.section, atIdx: indexPath.row)
        let content = MockDataProvider.shared.getBusinessCard(for: person.id)
        let vc = BusinessCardVC(with: content)
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.navigationBar.tintColor = UIColor(named: "academy")
    }
}
