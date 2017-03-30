
import UIKit
import PlaygroundSupport

let container = UIView(frame: CGRect(x: 0, y: 0, width: 768, height: 1024))

container.backgroundColor = UIColor.green


class MyController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = UIColor.red
		
		let upgradeView: UIView = UIView()
		upgradeView.translatesAutoresizingMaskIntoConstraints = false
		
		upgradeView.backgroundColor = UIColor.blue
		
		self.view.addSubview(upgradeView)

		let margins = self.view.layoutMarginsGuide
		print(margins)
		upgradeView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor,
		                                 constant: 0).isActive = true

		upgradeView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
		upgradeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
		
		upgradeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
		
		upgradeView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor,
		                                    constant: 0).isActive = true
		
		self.view!.setNeedsUpdateConstraints()

		
	}
	
}


let vc = MyController()

container.addSubview(vc.view)

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true

