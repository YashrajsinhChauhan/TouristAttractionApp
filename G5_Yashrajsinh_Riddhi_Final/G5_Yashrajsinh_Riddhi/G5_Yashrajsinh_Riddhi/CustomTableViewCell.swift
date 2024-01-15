import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var quantityPuchase: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var lblDate: UILabel!
   
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   

}
