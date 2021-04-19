//
//  ViewController.swift
//  Swift+UIKit
//
//  Created by Lonmee on 4/18/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var imagePicker: UIImagePickerController!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func PressHandler(_ sender: Any) {
        if self.imagePicker == nil {
            self.imagePicker = UIImagePickerController()
        }
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .photoLibrary
        self.present(self.imagePicker, animated: true, completion: nil)
        
        //        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        //            if self.imagePicker == nil{
        //                self.imagePicker = UIImagePickerController()
        //            }
        //            self.imagePicker.delegate = self
        //            self.imagePicker.sourceType = .camera
        //            self.present(self.imagePicker, animated: true, completion: nil)
        //        }
        //        else{
        //            let errorAlert = UIAlertController(title: "相机不可用", message: "", preferredStyle: UIAlertController.Style.alert)
        //            let cancelAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.cancel, handler: nil)
        //            errorAlert.addAction(cancelAction)
        //            self.present(errorAlert, animated: true, completion: nil)
        //        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker = nil
        self.dismiss(animated: true, completion: nil)
        print("dismiss")
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as! UIImage
        self.imageView.image = image
        self.imageView.contentMode = .scaleAspectFill
        self.imagePicker.delegate = nil
        self.dismiss(animated: true, completion: nil)
    }
    
}

