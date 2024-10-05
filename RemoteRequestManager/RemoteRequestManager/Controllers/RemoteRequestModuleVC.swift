import UIKit

class RemoteRequestModuleVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerCellFromNib(cellID: HeaderCell.identifier)
            tableView.registerCellFromNib(cellID: OptionCell.identifier)
        }
    }
    
    // MARK: Variables
    fileprivate var viewModel = HomeViewModel()
    fileprivate var allCountriesData = [CountryDetails]()
    
    // MARK: Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: Bind view model with interface
        bindViewModel()
        
        // MARK: Trigger Get All Countries Data Remote Request
        viewModel.getCountriesDetailsRequest()
    }
    
    // MARK: IB Actions
    
    // MARK: Shared Methods
    private func bindViewModel() {
        viewModel.$apiError.sink { [weak self] error in
            self?.handleError(error)
        }.store(in: &viewModel.cancellables)
        
        viewModel.$allCountriesData.sink { [weak self] data in
            self?.allCountriesData = data
            self?.tableView.reloadData()
        }.store(in: &viewModel.cancellables)
    }
    
    private func handleError(_ error: String?) {
        if let error {
            // Show toast with error message
            Toast.show(message: error)
        }
    }
}

// MARK: TableView - Delegates and DataSources
extension RemoteRequestModuleVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier) as! HeaderCell
        headerCell.titleLbl.textAlignment = .left
        headerCell.titleLbl.text = "Results"
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCountriesData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OptionCell.identifier, for: indexPath) as! OptionCell
        cell.details = allCountriesData[indexPath.row]
        return cell
    }
}
