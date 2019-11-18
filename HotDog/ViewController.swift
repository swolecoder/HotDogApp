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
         imagePicker.sourceType = .camera;
//        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false;
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker,animated: true,completion: nil)
    }
    
}

