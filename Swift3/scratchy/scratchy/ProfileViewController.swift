//
//  ProfileViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/9/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
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

class ProfileViewController: UIViewController {
	
	lazy var profilePictureImageView: UIImageView = {
		let imageView = UIImageView()

		if let pth = Bundle.main.path(forResource: "portrait", ofType: "png") {
			imageView.image = UIImage(contentsOfFile: pth)
		}


//		imageView.image = UIImage(named: "swiftBlue256")
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfilePicture)))
		imageView.isUserInteractionEnabled = true
		return imageView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
//		let ppiv = profilePictureImageView
//		
//		self.view.addSubview(ppiv)
//		
//		ppiv.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
//		ppiv.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
//		ppiv.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		ppiv.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		
		if let resourcePath = Bundle.main.resourcePath {
			let imgName = "swiftBlue256"
			let path = resourcePath + "/" + imgName
			print(path)
		}
		

		self.view.addSubview(profilePictureImageView)
		
		profilePictureImageView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
		profilePictureImageView.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
		profilePictureImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		profilePictureImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		

	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
