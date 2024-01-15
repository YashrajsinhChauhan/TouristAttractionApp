

import Foundation
import UIKit

public class TouristActivity {
    
    var image : UIImage!
    var placeName : String
    var pricePerPerson : String
    var description : String
    var host : String
    var website : String
    var price : Int
    
    init(image:UIImage!, placeName:String, pricePerPerson:String, description:String, host:String, website:String, price:Int){
        self.image = image
        self.placeName = placeName
        self.pricePerPerson = pricePerPerson
        self.description = description
        self.host = host
        self.website = website
        self.price = price
    }
}

