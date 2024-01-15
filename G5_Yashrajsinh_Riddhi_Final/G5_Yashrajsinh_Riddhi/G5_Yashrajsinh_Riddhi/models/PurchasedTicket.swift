import Foundation
import UIKit
public class PurchasedTicket {
   
    
    var placeName:String
    var purchaseQuantity:Int
    var purchasePrice:Int
    var purchaseDate:String
    
    init(placeName:String, purchaseQuantity:Int,purchasePrice:Int,purchaseDate:String){
        self.placeName = placeName
        self.purchasePrice = purchasePrice
        self.purchaseQuantity = purchaseQuantity
        self.purchaseDate = purchaseDate
    }
    
    
}
