public protocol ViewModelType {
    typealias Section = (header: String?, rows: [Person], footer: String?)
    typealias Model = [Section]
    
    var model: Model { get }
    var didUpdateModel: ((Model) -> Void)? { get set }
    
    func numberOfSections() -> Int
    func numberOfRows(inSection: Int) -> Int
    func modelForSection(_ section: Int) -> Section
    func modelForRow(inSection: Int, atIdx: Int) -> Person
}

public extension ViewModelType {
    public func numberOfSections() -> Int {
        return model.count
    }
    
    public func numberOfRows(inSection: Int) -> Int {
        return model[inSection].rows.count
    }
    
    public func modelForSection(_ section: Int) -> ViewModelType.Section {
        return model[section]
    }
    
    public func modelForRow(inSection: Int, atIdx: Int) -> Person {
        return model[inSection].rows[atIdx]
    }
}

public class ViewModel: ViewModelType {
    private let dataProvider: DataProviderType
    
    init() {
        self.dataProvider = RemoteDataProvider()
    }
    
    public var model: [ViewModelType.Section] = [] {
        didSet {
            didUpdateModel?(model)
        }
    }
    
    public var didUpdateModel: ((Model) -> Void)?
    
    public func loadContent() {
        dataProvider.loadPersonList { [weak self] personList in
            let students = personList!.map {
                $0
            }
            self?.model = [Section(header: nil, rows: students, footer: nil)]
        }
    }
}
