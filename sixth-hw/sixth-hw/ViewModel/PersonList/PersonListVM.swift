import Foundation

public class PersonListVM: PersonListVMType {
    private let dataProvider: DataProviderType
    
    init() {
        self.dataProvider = RemoteDataProvider()
    }
    
    public var model: [PersonListVMType.Section] = [] {
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
