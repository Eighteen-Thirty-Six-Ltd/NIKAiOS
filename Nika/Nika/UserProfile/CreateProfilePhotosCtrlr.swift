//
//  CreateProfilePhotosCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit
import AlamofireImage

class CreateProfilePhotosCtrlr: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var LBL_Step5: UILabel!
    @IBOutlet weak var LBL_Header: UILabel!
    
    @IBOutlet weak var BTN_Next: UIButton!
    @IBOutlet weak var VIEW_ProfilePic: UIView!
    @IBOutlet weak var VIEW_Pict1: UIView!
    @IBOutlet weak var VIEW_Pict2: UIView!
    @IBOutlet weak var VIEW_Pict3: UIView!
    
    @IBOutlet weak var IMAGE_ProfilePic: UIImageView!
    @IBOutlet weak var IMAGE_Pict1: UIImageView!
    @IBOutlet weak var IMAGE_Pict2: UIImageView!
    @IBOutlet weak var IMAGE_Pict3: UIImageView!
    
    var imagePicker = UIImagePickerController()

    var imagePreview : UIImageView!
    
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BTN_Next.addCornerRadius(cornerRadius: 10.0)
        BTN_Next.addShadow()
        
        VIEW_ProfilePic.addCornerRadius(cornerRadius: 10.0)
        VIEW_Pict1.addCornerRadius(cornerRadius: 10.0)
        VIEW_Pict2.addCornerRadius(cornerRadius: 10.0)
        VIEW_Pict3.addCornerRadius(cornerRadius: 10.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ((self.isMovingToParent && !self.isEditMode) || (self.isBeingPresented && self.isEditMode))
        {
            if (self.isEditMode)
            {
                LBL_Header.text = "Edit Profile"
                LBL_Step5.isHidden = true
                
                BTN_Next.setTitle("SUBMIT", for: .normal)
                
                if let mainPic = NikaDataManager.sharedDataManager.userProf.photoPaths.mainPic
                {
                    IMAGE_ProfilePic.af_setImage(withURL: URL(string: mainPic)!, placeholderImage: UIImage(named: ""))
                }
                
                if let pic1 = NikaDataManager.sharedDataManager.userProf.photoPaths.pic1
                {
                    IMAGE_Pict1.af_setImage(withURL: URL(string: pic1)!, placeholderImage: UIImage(named: ""))
                }
                
                if let pic2 = NikaDataManager.sharedDataManager.userProf.photoPaths.pic2
                {
                    IMAGE_Pict2.af_setImage(withURL: URL(string: pic2)!, placeholderImage: UIImage(named: ""))
                }
                
                if let pic3 = NikaDataManager.sharedDataManager.userProf.photoPaths.pic3
                {
                    IMAGE_Pict3.af_setImage(withURL: URL(string: pic3)!, placeholderImage: UIImage(named: ""))
                }
                
            }
            else
            {
                LBL_Header.text = "Create Profile"
                BTN_Next.setTitle("NEXT", for: .normal)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func nextTapped(_ sender: UIButton) {
        
        if (self.isEditMode)
        {
            NikaFirebaseManager.sharedManager.updateUserProfile(userProfile: NikaDataManager.sharedDataManager.userProf)
            
            if let profImage = IMAGE_ProfilePic.image
            {
                NikaFirebaseManager.sharedManager.uploadImageAndStoreURL(imageIdentifier: "mainPict", userProfile: NikaDataManager.sharedDataManager.userProf, image: profImage)
            }
            
            if let pict1 = IMAGE_Pict1.image
            {
                NikaFirebaseManager.sharedManager.uploadImageAndStoreURL(imageIdentifier: "pict1", userProfile: NikaDataManager.sharedDataManager.userProf, image: pict1)
            }
            
            if let pict2 = IMAGE_Pict2.image
            {
                NikaFirebaseManager.sharedManager.uploadImageAndStoreURL(imageIdentifier: "pict2", userProfile: NikaDataManager.sharedDataManager.userProf, image: pict2)
            }
            
            if let pict3 = IMAGE_Pict3.image
            {
                NikaFirebaseManager.sharedManager.uploadImageAndStoreURL(imageIdentifier: "pict3", userProfile: NikaDataManager.sharedDataManager.userProf, image: pict3)
            }
            
            let alert = UIAlertController(title: "Alert", message: "Successfully updated", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    self.dismiss(animated: true, completion: nil)
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            NikaFirebaseManager.sharedManager.addUserProfile(userProfile: NikaDataManager.sharedDataManager.userProf)
            
            if let profImage = IMAGE_ProfilePic.image
            {
                NikaFirebaseManager.sharedManager.uploadImageAndStoreURL(imageIdentifier: "mainPict", userProfile: NikaDataManager.sharedDataManager.userProf, image: profImage)
            }
            
            if let pict1 = IMAGE_Pict1.image
            {
                NikaFirebaseManager.sharedManager.uploadImageAndStoreURL(imageIdentifier: "pict1", userProfile: NikaDataManager.sharedDataManager.userProf, image: pict1)
            }
            
            if let pict2 = IMAGE_Pict2.image
            {
                NikaFirebaseManager.sharedManager.uploadImageAndStoreURL(imageIdentifier: "pict2", userProfile: NikaDataManager.sharedDataManager.userProf, image: pict2)
            }
            
            if let pict3 = IMAGE_Pict3.image
            {
                NikaFirebaseManager.sharedManager.uploadImageAndStoreURL(imageIdentifier: "pict3", userProfile: NikaDataManager.sharedDataManager.userProf, image: pict3)
            }
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let baseNav = mainStoryboard.instantiateViewController(withIdentifier: "NikaLocationPermissionCtrlr")
            self.present(baseNav, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        if (isEditMode)
        {
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func mainViewgestueTapped(_ sender: UITapGestureRecognizer) {
        
        imagePreview = IMAGE_ProfilePic
        
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func view1gestueTapped(_ sender: UITapGestureRecognizer) {
        
        imagePreview = IMAGE_Pict1
        
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func view2gestueTapped(_ sender: UITapGestureRecognizer) {
        
        imagePreview = IMAGE_Pict2
        
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func view3gestueTapped(_ sender: UITapGestureRecognizer) {
        
        imagePreview = IMAGE_Pict3
        
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let tempImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagePreview.image  = tempImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
