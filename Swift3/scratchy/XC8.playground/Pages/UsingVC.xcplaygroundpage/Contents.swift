
import UIKit
import PlaygroundSupport

class myPgVC: UIPageViewController, UIPageViewControllerDataSource
{
	var arrPageTitle = [String]()
	
	var arrOfControllers = [UIViewController]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		arrPageTitle = ["A", "B", "C", "D", "E"];
		
		for i in 0..<arrPageTitle.count {
			
			arrOfControllers.append(getViewControllerAtIndex(i))
			
		}
		
		self.dataSource = self
		
		self.setViewControllers([arrOfControllers[0]] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
		
	}
	
	func changeBKG(_ toColor: UIColor) {
		for vc in arrOfControllers {
			vc.view.backgroundColor = toColor
		}
	}
	
	func gotoPageByIndex(_ index: Int) {
		
		if index < arrOfControllers.count {
			
			self.setViewControllers([arrOfControllers[index]] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
			
		}
		
	}
	
	// MARK:- UIPageViewControllerDataSource Methods

	
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
	{
		
		var index: Int = arrOfControllers.index(of: viewController)!
		
		if ((index == 0) || (index == NSNotFound))
		{
			index = arrOfControllers.count
		}
		
		index -= 1
		
		return arrOfControllers[index]
		
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
	{
		
		var index: Int = arrOfControllers.index(of: viewController)!
		
		if (index == NSNotFound)
		{
			return nil;
		}
		
		index += 1;
		
		if (index == arrOfControllers.count)
		{
			index = 0
		}
		
		return arrOfControllers[index]
		
	}
	
	// MARK:- Other Methods
	func getViewControllerAtIndex(_ index: NSInteger) -> UIViewController
	{
		let vc = UIViewController()
		let r = self.view.bounds // CGRect(x: 20, y: 20, width: 120, height: 200)
		print(r)
		let v = vc.view
		v?.backgroundColor = UIColor.orange
		v?.frame = r
		let l = UILabel(frame: r.insetBy(dx: 20, dy: 20))
		l.backgroundColor = UIColor.lightGray
		v?.addSubview(l)
		l.text = arrPageTitle[index]
		l.textAlignment = .center
		
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
		
		vvA?.isUserInteractionEnabled = false
		
		self.view.addSubview(vvA!)
		
		vccA?.didMove(toParentViewController: self)
		
		vccB?.changeBKG(UIColor.green)

		vccB = myPgVC(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal)
		
		self.addChildViewController(vccB!)
		
		let vvB = vccB!.view
		vvB?.frame = CGRect(x: 260, y: 240, width: 200, height: 200)
		
		self.view.addSubview(vvB!)
		
		vccB?.didMove(toParentViewController: self)
		
		vccB?.changeBKG(UIColor.cyan)
		
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
//rootVC.addPageVCs()

PlaygroundPage.current.liveView = rootVC.view

//let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
////
//container.backgroundColor = UIColor.green
//
//
//PlaygroundPage.current.liveView = container
//PlaygroundPage.current.needsIndefiniteExecution = true
