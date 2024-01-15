import UIKit

class PurchaseTicket: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var db = FakeDatabase.shared
   private var purchaseTicketList : [PurchasedTicket] = []
    
    //var touristActivityList:[TouristActivity] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalCost: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.purchaseTicketList =  db.getAllTickets()
        print("AbC" , self.purchaseTicketList)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ticketCell")
        //tableView.reloadData()
        
        totalCost.text = String(self.purchaseTicketList.map{ $0.purchasePrice}.reduce(0 , +))
    }
    override func viewWillAppear(_ animated: Bool) {
        self.purchaseTicketList = db.getAllTickets()
        self.tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseTicketList.count
    }
    //display each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currTicket = self.purchaseTicketList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath)

        cell.textLabel?.text = "\(currTicket.purchaseQuantity) ticket for place:\(currTicket.placeName) at: $\(currTicket.purchasePrice) of:\(currTicket.purchaseDate))"
     
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            self.purchaseTicketList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
   
}
