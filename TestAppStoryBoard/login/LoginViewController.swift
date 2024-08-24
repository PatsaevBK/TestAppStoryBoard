import UIKit

final class LoginViewController: UIViewController {
  
  @IBOutlet weak var userName: UITextField!
  @IBOutlet weak var password: UITextField!
  
  private let rightUserName = "User"
  private let rightPassword = "1"
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let controller = segue.destination as? GreetingViewController
    controller?.userName = userName.text
  }
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    guard userName.text == rightUserName, password.text == rightPassword else {
      showAlert(title: "Invalid password or login", message: "Please, enter correct login or password") {
        self.password.text = ""
      }
      return false
    }
    return true
  }
  
  @IBAction func unwind(for segue: UIStoryboardSegue) {
    userName.text = ""
    password.text = ""
  }
  
  private func showAlert(title: String, message: String, actionOk: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
      actionOk?()
    }
    alert.addAction(okAction)
    present(alert, animated: true)
  }
  
  @IBAction func forgotRegisterData(_ sender: UIButton) {
    sender.tag == 0
    ? showAlert(title: "Ooops", message: "Your name is \(rightUserName)")
    : showAlert(title: "Ooops", message: "Your passwod is \(rightPassword)")
  }
}
