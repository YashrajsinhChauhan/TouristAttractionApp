import UIKit

class ActivityDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var db = FakeDatabase.shared
    
    let numberofTicket = ["1","2","3","4","5"]
    var placNameReceived = ""
    var imageReceived = UIImage()
    var descriptionReceived = ""
    var hostReceived = ""
    var priceReceived = ""
    var selectedNumberofTicket = ""
    var price = 0
    var websiteReceived = ""
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var lblPlaceName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblHost: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var webSite: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func websiteButton(_ sender: Any) {
       // websiteReceived.userActivity?.webpageURL = WebView
         
            // fetch website detail here
        guard let webScreen = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else {
            print("No Website Found")
            return
            }
        webScreen.web = websiteReceived
        
        self.navigationController?.pushViewController(webScreen, animated: true)
        }
 
    @IBAction func purchasePressed(_ sender: Any) {
        let selectedIndex = self.pickerView.selectedRow(inComponent: 0)
        let alertTitle = "Ticket Details"
        
        let purchaseTicket = PurchasedTicket(placeName: placNameReceived, purchaseQuantity: Int(numberofTicket[selectedIndex])! , purchasePrice: (self.price * Int(numberofTicket[selectedIndex])!), purchaseDate: dateFormatter(date:datePicker))
        
        db.addTicket(purchasedTicket: purchaseTicket)
        print(db.getAllTickets())
        
        let message = "Ticket Purchased \(numberofTicket[selectedIndex]) \nTotal Price: $\(self.price * Int(numberofTicket[selectedIndex])!) \n For Date: \(dateFormatter(date:datePicker))"
        
        let box = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        box.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(box, animated: true, completion: nil)
        
    }
    
    func dateFormatter(date:UIDatePicker) -> String {
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let selectedDate = dateFormatter.string(from: date.date)
        //print(selectedDate)
        return selectedDate
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imageReceived
        lblPlaceName.text = placNameReceived
        lblDescription.text = descriptionReceived
        lblHost.text = hostReceived
        lblPrice.text = priceReceived
     //webSite.buttonType = websiteButton(TouristActivity)
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(webSite)
        webSite.addTarget(self, action: #selector(websiteButton) , for: .touchUpInside)
        configureItems()
    }
    
    private func configureItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutButton))
       
   
    }
    @objc func logoutButton() {
        print("Logout Pressed")
        guard let screen = storyboard?.instantiateViewController(withIdentifier: "Screen1") as? ViewController else {
            print("Cannot Find Screen")
            return
        }
        navigationController?.pushViewController(screen, animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberofTicket.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberofTicket[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        purchaseButton.setTitle(numberofTicket[row], for: .normal)
        pickerView.isHidden =  true
    }
    
}
