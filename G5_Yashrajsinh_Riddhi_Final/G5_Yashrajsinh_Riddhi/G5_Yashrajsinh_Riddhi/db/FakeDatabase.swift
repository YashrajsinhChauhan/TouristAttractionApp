import Foundation
import UIKit

class FakeDatabase {
    
    static let shared = FakeDatabase()
    private init() {}
    
    private var purchaseTicketList : [PurchasedTicket] = []
    
    private  var touristActivityList : [TouristActivity] = [
        
        TouristActivity(image: UIImage(named: "eiffelTower"), placeName: "Eiffel Tower", pricePerPerson: "Price: $52 / Person ", description: "The Eiffel Tower is a wrought-iron \n lattice tower on the Champ de Mars in Paris, France.",host: "Janak" ,website: "https://www.toureiffel.paris/fr", price: 52),
        
        TouristActivity(image: UIImage(named: "artOfLouvre"), placeName: "Art Of Louvre", pricePerPerson: "Price: $55 / Person", description: "The Louvre, or the Louvre Museum, is the world's most-visited museum, and a historic landmark in Paris, France. ",host: "Harpal",website: "https://www.louvre.fr/en/explore",price: 55),
        
        TouristActivity(image:UIImage(named: "francePastry"), placeName: "French Pastry Tour", pricePerPerson: "Price: $100 / Person",description: "On our Secret Food Tour: Montmartre, you will discover the true spirit of this breathtaking area",host: "Krishna",website: "https://www.expedia.ca/",price: 100),
        
        TouristActivity(image: UIImage(named: "riverboatCruise"), placeName: "Riverboat Cruise", pricePerPerson: "Price: $30 / Person",description: "iscover the Seine River with the World's Leading River Cruise Line.",host: "Himashu",website: "https://www.vikingrivercruisescanada.com/",price: 30),
        
        TouristActivity(image: UIImage(named: "cabaraetShow"), placeName: "Cabaret Show", pricePerPerson: "Price: $85 / Person",description: "Cabaret is a form of theatrical entertainment featuring music, song, dance, recitation, or drama.",host: "Yash",website: "https://en.wikipedia.org/wiki/Cabaret",price: 85),
        
        TouristActivity(image: UIImage(named: "museeD'Orsay"), placeName: "Musee d'Orsay", pricePerPerson: "Price: $90 / Person",description: "The Musée d'Orsay is a museum in Paris, France, on the Left Bank of the Seine",host: "Hitashu",website: "https://en.wikipedia.org/wiki/Mus%C3%A9e_d%27Orsay",price: 90)
    ]
    func getAll() -> [TouristActivity] {
        return touristActivityList
    }
    
    func addTicket(purchasedTicket:PurchasedTicket){
        self.purchaseTicketList.append(purchasedTicket)
    }
    func getAllTickets() -> [PurchasedTicket]{
        return purchaseTicketList
}
}
