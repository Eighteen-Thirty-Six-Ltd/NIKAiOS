//
//  NikeSignUpController.swift
//  Nika
//
//  Created by Basavaraj  on 06/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit
import FirebaseAuth

class NikeSignUpController: UIViewController {

    @IBOutlet weak var BTN_Back: UIButton!
    
    @IBOutlet weak var LBL_Header: UILabel!
    @IBOutlet weak var LBL_Content: UILabel!
    
    @IBOutlet weak var VIEW_Bottom: UIView!
    
    @IBOutlet weak var VIEW_EmailID: UIView!
    @IBOutlet weak var TEXTFIELD_Email: UITextField!
    @IBOutlet weak var LBL_ValidationEmail: UILabel!
    
    @IBOutlet weak var VIEW_Password: UIView!
    @IBOutlet weak var TEXTFIELD_Password: UITextField!
    @IBOutlet weak var LBL_ValidationPassword: UILabel!
    
    @IBOutlet weak var VIEW_SignUp: UIView!
    @IBOutlet weak var BTN_TermsAndConditions: UIButton!
    @IBOutlet weak var BTN_Privacy: UIButton!
    
    @IBOutlet weak var VIEW_Login: UIView!
    @IBOutlet weak var BTN_ForgotPassword: UIButton!
    @IBOutlet weak var BTN_Sign: UIButton!
    
    @IBOutlet weak var BTN_Facebook: UIButton!
    
    @IBOutlet weak var BTN_LoginModeSignUp: UIButton!
    
    @IBOutlet weak var VIEW_SignUpMode: UIView!
    @IBOutlet weak var LBL_SignUpMode: UILabel!
    @IBOutlet weak var BTN_SignUpModeLogin: UIButton!
    
    var isSignInMode = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        VIEW_Bottom.addCornerRadius(cornerRadius: 20.0)
        
        BTN_Sign.addCornerRadius(cornerRadius: 10.0)
        BTN_Sign.addShadow()
        
        self.btnLoginModeSignUpTapped(BTN_LoginModeSignUp)
        
        self.isSignInMode = false
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnTermsConditionsTapped(_ sender: UIButton) {
        
        let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikaTermsAndConditionsCtrlr")
        self.present(baseNav!, animated: true, completion: nil)
    }
    
    @IBAction func btnPrivacyTapped(_ sender: UIButton) {
        
        let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikaPrivacyCtrlr")
        self.present(baseNav!, animated: true, completion: nil)
    }
    
    @IBAction func btnSignTapped(_ sender: UIButton) {
        
        if(self.validateInputs())
        {
            let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
            loadingNotification.mode = MBProgressHUDMode.indeterminate
            loadingNotification.label.text = "Loading"
            
            if(self.isSignInMode)
            {
                Auth.auth().signIn(withEmail: TEXTFIELD_Email.text!, password: TEXTFIELD_Password.text!) { [weak self] user, error in
                    guard let strongSelf = self else { return }
                    
                    MBProgressHUD.hideAllHUDs(for: strongSelf.view, animated: true)

                    if (error == nil)
                    {
                        let baseNav = self?.storyboard?.instantiateViewController(withIdentifier: "NikaHomeCtrlr")
                        strongSelf.present(baseNav!, animated: true, completion: nil)
                    }
                    else
                    {
                        let alert = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                            switch action.style{
                            case .default:
                                print("default")
                                
                            case .cancel:
                                print("cancel")
                                
                            case .destructive:
                                print("destructive")
                                
                                
                            }}))
                        strongSelf.present(alert, animated: true, completion: nil)
                    }
                }
            }
            else
            {
                Auth.auth().createUser(withEmail: TEXTFIELD_Email.text!, password: TEXTFIELD_Password.text!) { [weak self] user, error in
                    
                    guard let strongSelf = self else { return }

                    MBProgressHUD.hideAllHUDs(for: strongSelf.view, animated: true)

                    if (error == nil)
                    {
                        let baseNav = strongSelf.storyboard?.instantiateViewController(withIdentifier: "NikaVerifyEmailCtrlr")
                        strongSelf.present(baseNav!, animated: true, completion: nil)

                    }
                    else
                    {
                        let alert = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                            switch action.style{
                            case .default:
                                print("default")
                                
                            case .cancel:
                                print("cancel")
                                
                            case .destructive:
                                print("destructive")
                                
                                
                            }}))
                        strongSelf.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func btnFacebbokTapped(_ sender: UIButton) {
    }
    
    @IBAction func btnLoginModeSignUpTapped(_ sender: UIButton) {
        
        VIEW_SignUpMode.isHidden = false
        VIEW_SignUp.isHidden = false
        
        VIEW_Login.isHidden = true
        BTN_LoginModeSignUp.isHidden = true
        
        TEXTFIELD_Email.text = ""
        TEXTFIELD_Password.text = ""
        
        LBL_Header.text = "Hi there! Welcome"
        LBL_Content.text = "Register on NikaMatch by choosing a valid Email and carefully choosing your password"
        
        BTN_Sign.setTitle("SIGN UP", for: .normal)
        
        self.isSignInMode = false
        
        LBL_ValidationEmail.text = ""
        LBL_ValidationPassword.text = ""
    }
    
    @IBAction func btnSignUpModeLoginTapped(_ sender: UIButton) {
        
        VIEW_SignUpMode.isHidden = true
        VIEW_SignUp.isHidden = true
        
        VIEW_Login.isHidden = false
        BTN_LoginModeSignUp.isHidden = false
        
        TEXTFIELD_Email.text = ""
        TEXTFIELD_Password.text = ""
        
        LBL_Header.text = "Welcome Back"
        LBL_Content.text = "Login using your registered NikaMatch Email and Password"
        
        BTN_Sign.setTitle("SIGN IN", for: .normal)
        
        self.isSignInMode = true
        
        LBL_ValidationEmail.text = ""
        LBL_ValidationPassword.text = ""
    }
    
    func validateInputs() -> Bool {
        
        var isValid = true
        
        if (TEXTFIELD_Email.text!.count == 0)
        {
            LBL_ValidationEmail.text = "Please enter the Email"
            isValid = false
        }
        else
        {
            LBL_ValidationEmail.text = ""
        }
        
        if (TEXTFIELD_Password.text!.count == 0)
        {
            LBL_ValidationPassword.text = "Please enter the password"
            isValid = false
        }
        else
        {
            LBL_ValidationPassword.text = ""
        }
        
        return isValid
    }
    
    @IBAction func btnForgotPasswordTapped(_ sender: UIButton) {
    }
}
