//
//  ViewController.swift
//  SocialApp
//
//  Created by Anil on 09/01/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func selectImage(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as NSString]
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        postImage.image = image
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        postText.endEditing(true)
    }

    @IBAction func sendPost(sender: AnyObject) {
        
        var activityIteams : [AnyObject]?
        
        if postImage.image != nil{
            activityIteams = [postText.text, postImage.image!]
        }else{
            activityIteams = [postText.text]
        }
        let activityController = UIActivityViewController(activityItems: activityIteams!, applicationActivities: nil)
        self.presentViewController(activityController, animated: true, completion: nil)
        
    }
}

