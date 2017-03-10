//
//  CameraWithTargetViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/3/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class CameraWithTargetViewController: UIViewController {
	
	@IBOutlet weak var navigationBar: UINavigationBar!
	@IBOutlet weak var imgOverlay: UIImageView!
	@IBOutlet weak var btnCapture: UIButton!
	
	@IBOutlet weak var shapeLayer: UIView!
	
	let captureSession = AVCaptureSession()
	let stillImageOutput = AVCaptureStillImageOutput()
	var previewLayer : AVCaptureVideoPreviewLayer?
	
	//var shapeLayer : CALayer?
	
	// If we find a device we'll store it here for later use
	var captureDevice : AVCaptureDevice?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		//=======================
		
		captureSession.sessionPreset = AVCaptureSessionPresetHigh
		
		if let devices = AVCaptureDevice.devices() as? [AVCaptureDevice] {
			// Loop through all the capture devices on this phone
			for device in devices {
				// Make sure this particular device supports video
				if (device.hasMediaType(AVMediaTypeVideo)) {
					// Finally check the position and confirm we've got the back camera
					if(device.position == AVCaptureDevicePosition.back) {
						captureDevice = device
						if captureDevice != nil {
							print("Capture device found")
							beginSession()
						}
					}
				}
			}
		}
	}
	
	@IBAction func actionCameraCapture(_ sender: AnyObject) {
		
		print("Camera button pressed")
		saveToCamera()
	}
	
	func beginSession() {
		
		do {
			try captureSession.addInput(AVCaptureDeviceInput(device: captureDevice))
			stillImageOutput.outputSettings = [AVVideoCodecKey:AVVideoCodecJPEG]
			
			if captureSession.canAddOutput(stillImageOutput) {
				captureSession.addOutput(stillImageOutput)
			}
			
		}
		catch {
			print("error: \(error.localizedDescription)")
		}
		
		guard let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) else {
			print("no preview layer")
			return
		}
		// this is what displays the camera view. But - it's on TOP of the drawn view, and under the overview. ??
		self.view.layer.addSublayer(previewLayer)
		previewLayer.frame = self.view.layer.frame
		
		
		imgOverlay.frame = self.view.frame
		imgOverlay.image = self.drawCirclesOnImage(fromImage: nil, targetSize: imgOverlay.bounds.size)

		self.view.bringSubview(toFront: navigationBar)
		self.view.bringSubview(toFront: imgOverlay)
		self.view.bringSubview(toFront: btnCapture)
		// don't use shapeLayer anymore...
		//		self.view.bringSubview(toFront: shapeLayer)
		
		
		captureSession.startRunning()
		print("Capture session running")
		
	}
	
	func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
		let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: size.width, height: size.height))
		UIGraphicsBeginImageContextWithOptions(size, false, 0)
		color.setFill()
		UIRectFill(rect)
		let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()
		return image
	}
	
	func drawCirclesOnImage(fromImage: UIImage? = nil, targetSize: CGSize? = CGSize.zero) -> UIImage? {
		
		if fromImage == nil && targetSize == CGSize.zero {
			return nil
		}
		
		var tmpimg: UIImage?

		if targetSize == CGSize.zero {
			
			tmpimg = fromImage
			
		} else {
			
			tmpimg = getImageWithColor(color: UIColor.clear, size: targetSize!)
			
		}
		
		guard let img = tmpimg else {
			return nil
		}
		
		let imageSize = img.size
		let scale: CGFloat = 0
		UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)
		
		img.draw(at: CGPoint.zero)
		
		let w = imageSize.width
		
		let midX = imageSize.width / 2
		let midY = imageSize.height / 2
		
		// red circles - radius in %
		let circleRads = [ 0.07, 0.13, 0.17, 0.22, 0.29, 0.36, 0.40, 0.48, 0.60, 0.75 ]
		
		// center "dot" - radius is 1.5%
		var circlePath = UIBezierPath(arcCenter: CGPoint(x: midX,y: midY), radius: CGFloat(w * 0.015), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
		
		UIColor.red.setFill()
		circlePath.stroke()
		circlePath.fill()
		
		// blue circle is between first and second red circles
		circlePath = UIBezierPath(arcCenter: CGPoint(x: midX,y: midY), radius: w * CGFloat((circleRads[0] + circleRads[1]) / 2.0), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
		
		UIColor.blue.setStroke()
		circlePath.lineWidth = 2.5
		circlePath.stroke()
		
		UIColor.red.setStroke()
		
		for pct in circleRads {
			
			let rad = w * CGFloat(pct)
			
			circlePath = UIBezierPath(arcCenter: CGPoint(x: midX, y: midY), radius: CGFloat(rad), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
			
			circlePath.lineWidth = 2.5
			circlePath.stroke()
			
		}
		
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return newImage
	}
	
	func saveToCamera() {

		if let videoConnection = stillImageOutput.connection(withMediaType: AVMediaTypeVideo) {
			stillImageOutput.captureStillImageAsynchronously(from: videoConnection, completionHandler: { (CMSampleBuffer, Error) in
				
				if let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(CMSampleBuffer) {
					if let cameraImage = UIImage(data: imageData) {
						
						if let nImage = self.drawCirclesOnImage(fromImage: cameraImage, targetSize: CGSize.zero) {
							UIImageWriteToSavedPhotosAlbum(nImage, nil, nil, nil)
						}
						
					}
				}
			})
		}
	}
	
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
