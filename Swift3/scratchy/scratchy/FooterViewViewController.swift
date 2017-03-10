//
//  FooterViewViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/3/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

extension FooterViewViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func handleSelectProfilePicture() {
		let picker = UIImagePickerController()
		picker.delegate = self
		picker.allowsEditing = true
		present(picker, animated: true, completion: nil)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		var selectedImageFromPicker: UIImage?
		if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
			selectedImageFromPicker = editedImage
		}
		else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
			selectedImageFromPicker = originalImage
		}
		if let selectedImage = selectedImageFromPicker {
			profilePictureImageView.image = selectedImage
		}
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}

class FooterViewViewController: UIViewController {

	lazy var profilePictureImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "swiftBlue256")
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit // .scaleAspectFill
		
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfilePicture)))
		imageView.isUserInteractionEnabled = true
		return imageView
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let ppiv = profilePictureImageView
		
		ppiv.backgroundColor = UIColor.blue
		
		ppiv.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
		ppiv.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
		
		self.view.addSubview(ppiv)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
