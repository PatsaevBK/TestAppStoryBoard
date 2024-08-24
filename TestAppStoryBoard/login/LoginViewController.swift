import UIKit

final class LoginViewController: UIViewController {
  
  @IBOutlet weak var userName: UITextField!
  @IBOutlet weak var password: UITextField!
  
  private let rightUserName = "User"
  private let rightPassword = "1"
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let controller = segue.destination as? GreetingViewController
    controller?.userName = userName.text
  }
  
  private func checkNameAndPassword() -> Bool {
    if let userName = userName.text, let password = password.text {
      return (userName == rightUserName) && (password == rightPassword)
    }
    return false
  }
  
  @IBAction func tapOnLogin(_ sender: Any) {
    if checkNameAndPassword() {
      self.performSegue(withIdentifier: "ShowGreetings", sender: nil)
    } else {
      let alert = UIAlertController(title: "Invalid password or login", message: "Please, enter correct login or password", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .destructive) {_ in 
        self.password.text = ""
      })
      self.present(alert, animated: true)
    }
  }
}
