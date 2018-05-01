public protocol PersonListVMType {
    typealias Section = (header: String?, rows: [Person], footer: String?)
    typealias Model = [Section]
    
    var model: Model { get }
    var didUpdateModel: ((Model) -> Void)? { get set }
    
    func loadContent() -> Void
    func numberOfSections() -> Int
    func numberOfRows(inSection: Int) -> Int
    func modelForSection(_ section: Int) -> Section
    func modelForRow(inSection: Int, atIdx: Int) -> Person
}

public extension PersonListVMType {
    public func numberOfSections() -> Int {
        return model.count
    }
    
    public func numberOfRows(inSection: Int) -> Int {
        return model[inSection].rows.count
    }
    
    public func modelForSection(_ section: Int) -> PersonListVMType.Section {
        return model[section]
    }
    
    public func modelForRow(inSection: Int, atIdx: Int) -> Person {
        return model[inSection].rows[atIdx]
    }
}
