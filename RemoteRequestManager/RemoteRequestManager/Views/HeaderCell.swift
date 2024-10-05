import UIKit

class HeaderCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    // MARK: Variables
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    // MARK: Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Shared Methods
    
    // MARK: IB Actions
}
