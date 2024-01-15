import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var EmailEntered: UITextField!
    @IBOutlet weak var PasswordEntered: UITextField!
    @IBOutlet weak var RememberMe: UISwitch!
    
    @IBOutlet weak var loginPressed: UIButton!
    var user : User = User()
    var saveLogin : Bool! = false
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PasswordEntered.isSecureTextEntry = true
        loginPressed.addTarget(self, action: #selector(tapForSave), for: .touchUpInside)
        retriveInfo()

    }
    @objc private func tapForSave() {
        UserDefaults.standard.set(EmailEntered.text, forKey: "Email")
        UserDefaults.standard.set(PasswordEntered.text, forKey: "Password")
    }
    private func retriveInfo() {
        let EmailEntered = UserDefaults.standard.string(forKey: "Email")
        let PasswordEntered = UserDefaults.standard.string(forKey: "Password")
        
        print("Email = \(EmailEntered!), Password = \(PasswordEntered!)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true   
    }
    
    
    @IBAction func RememberMePressed(_ sender: Any) {
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        
        if EmailEntered.text == self.user.email[0] && PasswordEntered.text == self.user.password[0] || EmailEntered.text == self.user.email[1] && PasswordEntered.text == self.user.password[1] || EmailEntered.text == self.user.email[2] && PasswordEntered.text == self.user.password[2]
        {
            guard let screen2 = storyboard?.instantiateViewController(withIdentifier: "tabBar") as? UITabBarController else {
                print("Cannot find next screen")
                return
            }
            self.navigationController?.pushViewController(screen2, animated: true)
            print("Login success")
        }else{
            print("Login Failed")
        }
    }
}
