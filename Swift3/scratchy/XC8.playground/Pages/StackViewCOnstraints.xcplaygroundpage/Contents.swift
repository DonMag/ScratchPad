
import Foundation
import UIKit
import PlaygroundSupport

class testViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupSocialStackView()
	}
	
	func setupSocialStackView() {
		let socialStackView = UIStackView(arrangedSubviews: [redImage, blueImage, registerView])
		
		socialStackView.axis = .vertical
		socialStackView.distribution = .fillProportionally
		view.addSubview(socialStackView)
		socialStackView.spacing = 8
		
		// NSLayoutAnchor constraints here to place stack view
		// inside my view controller view
		
		//socialStackView.frame = CGRect(x: 20, y: 20, width: 280, height: 300)
		
		
		let viewsDictionary = ["stackView":socialStackView]
		let stackView_H = NSLayoutConstraint.constraints(
			withVisualFormat: "H:|-20-[stackView]-20-|",  //horizontal constraint 20 points from left and right side
			options: NSLayoutFormatOptions(rawValue: 0),
			metrics: nil,
			views: viewsDictionary)
		let stackView_V = NSLayoutConstraint.constraints(
			withVisualFormat: "V:|-30-[stackView]-30-|", //vertical constraint 30 points from top and bottom
			options: NSLayoutFormatOptions(rawValue:0),
			metrics: nil,
			views: viewsDictionary)
		view.addConstraints(stackView_H)
		view.addConstraints(stackView_V)

		
	}
	

	lazy var registerView: UIView = {
		let containerView = UIView()
		containerView.backgroundColor = UIColor.cyan
		
		// Register button
		let registerButton = UIButton(type: .system)
		registerButton.setTitle("Register", for: .normal)
		registerButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		containerView.addSubview(registerButton)
		
		return containerView
	}()
	
	lazy var redImage: UIImageView = {
		let imgv = UIImageView()
		imgv.backgroundColor = UIColor.red
		return imgv
	}()
	
	lazy var blueImage: UIImageView = {
		let imgv = UIImageView()
		imgv.backgroundColor = UIColor.blue
		return imgv
	}()
	
	
}

let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
//
container.backgroundColor = UIColor.green

let vc = testViewController()
//vc.view.frame = CGRect(x: 0, y: 0, width: 600, height: 400)
vc.view.backgroundColor = UIColor.yellow

container.addSubview(vc.view)

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true
