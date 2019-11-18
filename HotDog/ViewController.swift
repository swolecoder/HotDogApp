//
//  ViewController.swift
//  HotDog
//
//  Created by Ashish Ranjan on 11/18/19.
//  Copyright © 2019 Ashish Ranjan. All rights reserved.
//

import UIKit
import CoreML;
import Vision;

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self;
        // imagePicker.sourceType = .camera;
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false;
    }
    
    //iuser has picked an image or movie
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = userPickedImage;
            
            guard  let ciImage = CIImage(image: userPickedImage) else{
                fatalError("Couldn't convert to CIImage");
            }
        }
        
        imagePicker.dismiss(animated: true, completion:nil)
        
    }
    
    
    func detect(image: CIImage){
       guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
             fatalError("Model failed");
        }
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker,animated: true,completion: nil)
    }
    
}

