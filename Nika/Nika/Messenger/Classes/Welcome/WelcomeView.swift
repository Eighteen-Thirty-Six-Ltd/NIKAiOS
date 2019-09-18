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
class WelcomeView: UIViewController, LoginGoogleDelegate, LoginPhoneDelegate, LoginEmailDelegate, RegisterEmailDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
	}

	// MARK: - Phone login methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLoginPhone(_ sender: Any) {

		let loginPhoneView = LoginPhoneView()
		loginPhoneView.delegate = self
		let navController = NavigationController(rootViewController: loginPhoneView)
		present(navController, animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func didLoginPhone() {

		dismiss(animated: true) {
			UserLoggedIn(loginMethod: LOGIN_PHONE)
		}
	}

	// MARK: - Google login methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLoginGoogle(_ sender: Any) {

		let loginGoogleView = LoginGoogleView()
		loginGoogleView.delegate = self
		present(loginGoogleView, animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func didLoginGoogle() {

		dismiss(animated: true) {
			UserLoggedIn(loginMethod: LOGIN_GOOGLE)
		}
	}

	// MARK: - Facebook login methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLoginFacebook(_ sender: Any) {

		ProgressHUD.show(nil, interaction: false)

		signInWithFacebook(completion: { user, error in
			if (error == nil) {
				if (user != nil) {
					self.dismiss(animated: true) {
						UserLoggedIn(loginMethod: LOGIN_FACEBOOK)
					}
				} else {
					ProgressHUD.dismiss()
				}
			} else {
				ProgressHUD.showError(error?.localizedDescription)
			}
		})
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func signInWithFacebook(completion: @escaping (_ user: FUser?, _ error: Error?) -> Void) {

		let login = FBSDKLoginManager()
		let permissions = ["public_profile", "email"]
		login.logIn(withReadPermissions: permissions, from: self, handler: { result, error in
			if (error == nil) {
				if (result?.isCancelled == false) {
					let accessToken = FBSDKAccessToken.current().tokenString
					let credential = FacebookAuthProvider.credential(withAccessToken: accessToken!)
					FUser.signIn(credential: credential, completion: completion)
				} else { completion(nil, nil) }
			} else { completion(nil, error) }
		})
	}

	// MARK: - Email login methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLoginEmail(_ sender: Any) {

		let loginEmailView = LoginEmailView()
		loginEmailView.delegate = self
		present(loginEmailView, animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func didLoginEmail() {

		dismiss(animated: true) {
			UserLoggedIn(loginMethod: LOGIN_EMAIL)
		}
	}

	// MARK: - Email register methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRegisterEmail(_ sender: Any) {

		let registerEmailView = RegisterEmailView()
		registerEmailView.delegate = self
		present(registerEmailView, animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func didRegisterUser() {

		dismiss(animated: true) {
			UserLoggedIn(loginMethod: LOGIN_EMAIL)
		}
	}
}
