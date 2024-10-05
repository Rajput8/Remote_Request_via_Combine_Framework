import UIKit

class OptionCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var countryNameLbl: UILabel!
    
    // MARK: Variables
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var details: CountryDetails? {
        didSet {
            countryNameLbl.text = details?.name?.common ?? ""
        }
    }
    
    // MARK: Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Shared Methods
    
    // MARK: IB Actions
    
}
