//
//  ViewController.swift
//  beforeAfter
//
//  Created by hoaqt on 10/3/16.
//  Copyright © 2016 com.noron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var touchedImageView: UIImageView?
    
    @IBOutlet weak var imageViewBefore: UITouchImageView!
    
    @IBOutlet weak var imageViewAfter: UITouchImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewBefore.delegate = self
        imageViewAfter.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITouchImageViewDelegate {
    func onTouch(imageView: UITouchImageView) {
        touchedImageView = imageView
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        presentViewController(vc, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        touchedImageView?.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
}

