import UIKit

class TouristActivityCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var NameOfPlace: UILabel!
    @IBOutlet weak var PricePerPerson: UILabel!
    func setup(with touristActivityList : TouristActivity) {
        Image.image = touristActivityList.image
        NameOfPlace.text = touristActivityList.placeName
        PricePerPerson.text = touristActivityList.pricePerPerson
    }
    
}
