
import UIKit
import PlaygroundSupport

class MyCVC : UICollectionViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.collectionView?.backgroundColor = .white
		self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 12
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath)
		cell.backgroundColor = .green

		if cell.subviews.count == 1 {

			let l = UILabel(frame: cell.bounds.insetBy(dx: 8, dy: 8))
			l.backgroundColor = UIColor.lightGray
			cell.addSubview(l)
			l.text = "\(indexPath.row)"
			l.textAlignment = .center

		}
		
		return cell
	}
	
}

class MyViewController: UIViewController, UICollectionViewDelegate {
	
	var cvc1: MyCVC?
	
	private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		print(indexPath)
	}
	
	init(frame: CGRect) {
		super.init(nibName: nil, bundle: nil)
		
		self.view = UIView(frame: frame)
		self.view.backgroundColor = UIColor.red
		
		
		let r = CGRect(x: 20, y: 20, width: 400, height: 140)
		
		cvc1 = MyCVC(collectionViewLayout: UICollectionViewFlowLayout())
		
//		self.addChildViewController(cvc1!)
		
		cvc1?.view.frame = r
		
		self.view.addSubview((cvc1?.view)!)
			
//		cvc1?.didMove(toParentViewController: self)
		
		cvc1?.collectionView?.delegate = self
		cvc1?.collectionView?.allowsSelection = true
		cvc1?.collectionView?.allowsMultipleSelection = true

		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

let rootVC = MyViewController(frame: CGRect(x: 0, y: 0, width: 600, height: 600))

PlaygroundPage.current.liveView = rootVC.view
