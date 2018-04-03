public protocol ViewModelType {
    typealias Section = (header: String?, rows: [PersonType], footer: String?)
    typealias Model = [Section]
    
    var model: Model { get }
    var didUpdateModel: ((Model) -> Void)? { get set }
    
    func numberOfSections() -> Int
    func numberOfRows(inSection: Int) -> Int
    func modelForSection(_ section: Int) -> Section
    func modelForRow(inSection: Int, atIdx: Int) -> PersonType
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
    
    public func modelForRow(inSection: Int, atIdx: Int) -> PersonType {
        return model[inSection].rows[atIdx]
    }
}

public class ViewModel: ViewModelType {
    public init() {}
    
    public var model: [ViewModelType.Section] = [] {
        didSet {
            didUpdateModel?(model)
        }
    }
    
    public var didUpdateModel: ((Model) -> Void)?
    
    public func loadContent() {
        let students = MockDataProvider.shared.getStudents()

        model = [Section(header: nil, rows: students, footer: nil)]
    }
}
