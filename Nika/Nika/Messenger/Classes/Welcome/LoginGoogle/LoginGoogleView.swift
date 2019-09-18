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
@objc protocol LoginGoogleDelegate: class {

	func didLoginGoogle()
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
class LoginGoogleView: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

	@IBOutlet weak var delegate: LoginGoogleDelegate?

	private var initialized = false

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		GIDSignIn.sharedInstance().uiDelegate = self
		GIDSignIn.sharedInstance().delegate = self
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidAppear(_ animated: Bool) {

		super.viewDidAppear(animated)

		if (initialized == false) {
			initialized = true
			actionGoogle()
		}
	}

	// MARK: - Google login methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionGoogle() {

		GIDSignIn.sharedInstance().signIn()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {

		if (user != nil) {
			signin(withGoogle: user)
		} else {
			dismiss(animated: true)
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {

		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func signin(withGoogle googleUser: GIDGoogleUser) {

		ProgressHUD.show(nil, interaction: false)

		let authentication = googleUser.authentication
		let credential = GoogleAuthProvider.credential(withIDToken: authentication!.idToken, accessToken: authentication!.accessToken)

		FUser.signIn(credential: credential) { user, error in
			if (error == nil) {
				self.dismiss(animated: true) {
					self.delegate?.didLoginGoogle()
				}
			} else {
				ProgressHUD.showError(error!.localizedDescription)
			}
		}
	}
}
