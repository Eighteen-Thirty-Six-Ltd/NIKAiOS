//
// Copyright (c) 2018 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

//-------------------------------------------------------------------------------------------------------------------------------------------------
@objc protocol LoginPhoneDelegate: class {

	func didLoginPhone()
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
class LoginPhoneView: UIViewController, UITextFieldDelegate, CountriesDelegate, VerifySMSDelegate {

	@IBOutlet weak var delegate: LoginPhoneDelegate?

	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelCode: UILabel!
	@IBOutlet var fieldPhone: UITextField!

	private var buttonRight: UIBarButtonItem?

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Phone Login"

		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(actionCancel))

		buttonRight = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(actionNext))

		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(gestureRecognizer)
		gestureRecognizer.cancelsTouchesInView = false

		if let countries = NSArray(contentsOfFile: Dir.application("countries.plist")) {
			let country = countries[Int(DEFAULT_COUNTRY)] as! [String: String]
			labelName.text = country["name"]
			labelCode.text = country["dial_code"]
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		dismissKeyboard()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func dismissKeyboard() {

		view.endEditing(true)
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancel() {

		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionNext() {

		let code = labelCode.text ?? ""
		let phone = fieldPhone.text ?? ""
		
		let verifySMSView = VerifySMSView()
		verifySMSView.myInit(countryCode: code, phoneNumber: phone)
		verifySMSView.delegate = self
		let navController = NavigationController(rootViewController: verifySMSView)
		present(navController, animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCountries(_ sender: Any) {

		let countriesView = CountriesView()
		countriesView.delegate = self
		let navController = NavigationController(rootViewController: countriesView)
		present(navController, animated: true)
	}

	// MARK: - VerifySMSDelegate
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func verifySMSSucceed() {

		let phone = "\(labelCode.text)\(fieldPhone.text)"
		let restricted = CharacterSet(charactersIn: "0123456789").inverted
		let numbers = phone.components(separatedBy: restricted).joined(separator: "")
		let email = "\(numbers)@\(PHONE_LOGIN_DOMAIN)"

		actionLogin(email: email, password: PHONE_LOGIN_PASSWORD)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func verifySMSFailed() {

		ProgressHUD.showError("SMS verification failed.")
	}

	// MARK: - CountriesDelegate
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func didSelectCountry(name: String, code: String) {

		labelName.text = name
		labelCode.text = code
		fieldPhone.becomeFirstResponder()
	}

	// MARK: - Login, Register methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionLogin(email: String, password: String) {

		ProgressHUD.show(nil, interaction: false)

		FUser.signIn(email: email, password: password) { user, error in
			if (error == nil) {
				self.dismiss(animated: true) {
					self.delegate?.didLoginPhone()
				}
			} else {
				self.actionRegister(email: email, password: password)
			}
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionRegister(email: String, password: String) {

		FUser.createUser(email: email, password: password) { user, error in
			if (error == nil) {
				self.saveUserPhone()
				self.dismiss(animated: true) {
					self.delegate?.didLoginPhone()
				}
			} else {
				ProgressHUD.showError(error!.localizedDescription)
			}
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func saveUserPhone() {

		let user = FUser.currentUser()

		user[FUSER_PHONE] = "\(labelCode.text)\(fieldPhone.text)"

		user.saveInBackground(block: { error in
			if (error != nil) {
				ProgressHUD.showError("Network error.")
			}
		})
	}

	// MARK: - UITextFieldDelegate
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

		let text = (textField.text ?? "") as NSString
		let phone = text.replacingCharacters(in: range, with: string)
		navigationItem.rightBarButtonItem = (phone.count != 0) ? buttonRight : nil

		return true
	}
}
