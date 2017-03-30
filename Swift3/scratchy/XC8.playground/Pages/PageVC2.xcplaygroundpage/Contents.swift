
import UIKit
import PlaygroundSupport

class myPage: UIViewController {
	
	var theLabel: UILabel?
	
	var theText: String = "x" {
		didSet {
			theLabel?.text = theText
		}
	}
	var theIDX: Int = 0
	
	init(frame: CGRect) {
		
		super.init(nibName: nil, bundle: nil)
		
		self.view = UIView(frame: frame)

		self.view.backgroundColor = UIColor.orange
		let l = UILabel(frame: frame.insetBy(dx: 20, dy: 20))
		l.backgroundColor = UIColor.lightGray
		self.view.addSubview(l)
		l.text = theText
		l.textAlignment = .center
		
		theLabel = l
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

class myPgVC: UIPageViewController, UIPageViewControllerDataSource
{
	var arrPageTitle = [String]()
	var pgBackgroundColor = UIColor.orange
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		arrPageTitle = ["A", "B", "C", "D", "E"];
		
		self.dataSource = self
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
		
	}
	
	func changeBKG(_ toColor: UIColor) {
		pgBackgroundColor = toColor
		
		guard let vcs = self.viewControllers else {
			return
		}
		
		if vcs.isEmpty { return }
		
		if let vc = self.viewControllers?[0] as? myPage {
			vc.view.backgroundColor = pgBackgroundColor
		}

	}
	
	func gotoPageByIndex(_ index: Int) {
		
		if index < arrPageTitle.count {
			
			self.setViewControllers([getViewControllerAtIndex(index)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
			
		}
		
	}
	
	// MARK:- UIPageViewControllerDataSource Methods
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
	{
		
		guard let vc = viewController as? myPage else {
			return nil
		}
		
		var index: Int = vc.theIDX
		
		if ((index == 0) || (index == NSNotFound))
		{
			index = arrPageTitle.count
		}
		
		index -= 1
		
		return getViewControllerAtIndex(index)
		
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
	{
		
		guard let vc = viewController as? myPage else {
			return nil
		}
		
		var index: Int = vc.theIDX
		
		if (index == NSNotFound)
		{
			return nil;
		}
		
		index += 1;
		
		if (index == arrPageTitle.count)
		{
			index = 0
		}
		
		return getViewControllerAtIndex(index)
		
	}
	
	// MARK:- Other Methods
	func getViewControllerAtIndex(_ index: NSInteger) -> UIViewController
	{

		let vc = myPage(frame: self.view.bounds)
		vc.theIDX = index
		vc.theText = arrPageTitle[index]
		vc.view.backgroundColor = pgBackgroundColor
		
		return vc
	}
}


class MyViewController: UIViewController {
	
	var vccA: myPgVC?
	var vccB: myPgVC?
	
	init(frame: CGRect) {
		super.init(nibName: nil, bundle: nil)
		
		self.view = UIView(frame: frame)
		self.view.backgroundColor = UIColor.white
		
		vccA = myPgVC(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal)
		
		self.addChildViewController(vccA!)
		
		let vvA = vccA!.view
		vvA?.frame = CGRect(x: 260, y: 20, width: 200, height: 200)
		
//		vvA?.isUserInteractionEnabled = false
		
		self.view.addSubview(vvA!)
		
		vccA?.didMove(toParentViewController: self)

		vccA?.changeBKG(UIColor.blue)
		
		
//		vccA?.changeBKG(UIColor.green)
//		
//		vccB = myPgVC(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal)
//		
//		self.addChildViewController(vccB!)
//		
//		let vvB = vccB!.view
//		vvB?.frame = CGRect(x: 260, y: 240, width: 200, height: 200)
//		
//		self.view.addSubview(vvB!)
//		
//		vccB?.didMove(toParentViewController: self)
//		
//		vccB?.changeBKG(UIColor.cyan)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func addPageVCs() {
		
		let vcA = myPgVC(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal)
		
		let vA = vcA.view
		vA?.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
		
		vA?.isUserInteractionEnabled = false
		
		self.view.addSubview(vA!)
		
		let vcB = myPgVC(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal)
		
		let vB = vcB.view
		vB?.frame = CGRect(x: 20, y: 240, width: 200, height: 200)
		self.view.addSubview(vB!)
		
		vcB.changeBKG(UIColor.blue)
		
	}
	
}

let rootVC = MyViewController(frame: CGRect(x: 0, y: 0, width: 600, height: 600))

//let p = myPage(frame: CGRect(x: 260, y: 20, width: 200, height: 200))
//rootVC.addChildViewController(p)
//p.view.backgroundColor = UIColor.purple
//rootVC.view.addSubview(p.view)

PlaygroundPage.current.liveView = rootVC.view

//let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
////
//container.backgroundColor = UIColor.green
//
//
//PlaygroundPage.current.liveView = container
//PlaygroundPage.current.needsIndefiniteExecution = true
