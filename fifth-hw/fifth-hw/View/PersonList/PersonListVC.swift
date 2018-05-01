import UIKit
import Foundation

class PersonListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var viewModel: PersonListVMType
    let tableView: UITableView
    var loadingIndicator: UIActivityIndicatorView?
    
    init(viewModel: PersonListVMType) {
        self.viewModel = viewModel
        self.tableView = UITableView(frame: .zero, style: .grouped)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadingIndicator?.startAnimating()
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
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBar.topItem?.title = "Seznam studentů"
        
        loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        tableView.backgroundView = loadingIndicator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.didUpdateModel = { [weak self] model in
            self?.tableView.reloadData()
        }
        self.viewModel.loadContent()
    }
    
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
            detail.append(NSAttributedString(string: i.emoji, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]))
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
        let loadingVC = UIViewController()
        let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        loadingIndicator.startAnimating()
        loadingVC.view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: loadingVC.view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: loadingVC.view.centerYAnchor).isActive = true
        
        self.navigationController?.pushViewController(loadingVC, animated: false)
        
        let dataProvider = RemoteDataProvider()
        dataProvider.loadPerson(id: person.id) { [weak self] person in
            let content = person
            let businessCardVC = BusinessCardVC(with: content!)
            self?.navigationController?.popViewController(animated: false)
            self?.navigationController?.pushViewController(businessCardVC, animated: false)
        }
    }
}
