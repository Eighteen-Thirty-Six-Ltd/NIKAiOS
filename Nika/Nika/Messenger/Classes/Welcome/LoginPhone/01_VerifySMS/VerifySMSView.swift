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
@objc protocol VerifySMSDelegate: class {

	func verifySMSSucceed()
	func verifySMSFailed()
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
class VerifySMSView: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var delegate: VerifySMSDelegate?

	@IBOutlet private var labelHeader: UILabel!
	@IBOutlet private var fieldCode: UITextField!

	private var countryCode = ""
	private var phoneNumber = ""

	private var verification: SINVerification!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func myInit(countryCode countryCode_: String, phoneNumber phoneNumber_: String) {

		countryCode = countryCode_
		phoneNumber = phoneNumber_
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "SMS Verification"

		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(actionDismissFailed))

		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(gestureRecognizer)
		gestureRecognizer.cancelsTouchesInView = false

		labelHeader.text = "Enter the verification code sent to\n\n\(countryCode) \(phoneNumber)"

		verifyNumber()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidAppear(_ animated: Bool) {

		super.viewDidAppear(animated)

		fieldCode.becomeFirstResponder()
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

	// MARK: - Sinch methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func verifyNumber() {

		let defaultRegion = SINDeviceRegion.currentCountryCode()

		let number = "\(countryCode)\(phoneNumber)"

		if let tempNumber = try? SINPhoneNumberUtil().parse(number, defaultRegion: defaultRegion) {
			let phoneNumberInE164 = SINPhoneNumberUtil().formatNumber(tempNumber, format: SINPhoneNumberFormat.E164)
			verification = SINVerification.smsVerification(withApplicationKey: SINCH_KEY, phoneNumber: phoneNumberInE164) as? SINVerification
//			verification.initiateWithCompletionHandler ({ result, error in
//				if (error != nil) { self.actionDismissFailed() }
//			})
		} else {
			actionDismissFailed()
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func verifyCode(code: String) {

		dismissKeyboard()

		ProgressHUD.show(nil, interaction: false)

//		verification.verifyCode(code, completionHandler: { success, error in
//			if (success == false) {
//				ProgressHUD.showError("The entered code is invalid.")
//				self.fieldCode.becomeFirstResponder()
//			} else {
//				self.actionDismissSucceed()
//			}
//		})
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionDismissSucceed() {

		dismiss(animated: true) {
			self.delegate?.verifySMSSucceed()
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDismissFailed() {

		dismiss(animated: true) {
			self.delegate?.verifySMSFailed()
		}
	}

	// MARK: - UITextFieldDelegate
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

		let text = (textField.text ?? "") as NSString
		let code = text.replacingCharacters(in: range, with: string)

		if (code.count == 4) {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
				self.verifyCode(code: code)
			}
		}

		return (code.count <= 4)
	}
}
