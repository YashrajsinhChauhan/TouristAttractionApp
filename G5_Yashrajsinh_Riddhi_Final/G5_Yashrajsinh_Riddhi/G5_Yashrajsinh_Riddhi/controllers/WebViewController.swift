import UIKit
import WebKit

class WebViewController: UIViewController {
@IBOutlet weak var placeWebView: WKWebView!
    var web : String = ""
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: URL(string: web)!)
        placeWebView.load(request)
        
    
    }
    

    

}
