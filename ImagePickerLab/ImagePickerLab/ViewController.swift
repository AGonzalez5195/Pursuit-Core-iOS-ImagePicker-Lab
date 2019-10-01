//
//  ViewController.swift
//  ImagePickerLab
//
//  Created by Anthony Gonzalez on 10/1/19.
//  Copyright © 2019 Antnee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    @IBAction func addImageButtonPressed(_ sender: Any) {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(imagePickerViewController, animated: true, completion: nil)
    }
    private func setCircleOutline() {
         imageView.layer.cornerRadius = imageView.frame.size.width/2
         imageView.clipsToBounds = true
         imageView.layer.borderColor = UIColor.black.cgColor
         imageView.layer.borderWidth = 7.0
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCircleOutline()
        
    }
    
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            //couldn't get image :(
            return
        }
        self.image = image
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameLabel.text = textField.text
        return true
    }
}
