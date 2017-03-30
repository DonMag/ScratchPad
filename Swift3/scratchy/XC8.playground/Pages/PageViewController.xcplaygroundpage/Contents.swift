

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
	
	func gotoPageByIndex(_ index: Int) {

		if index < arrOfControllers.count {

			self.setViewControllers([arrOfControllers[index]] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)

		}

	}
	
	// MARK:- UIPageViewControllerDataSource Methods
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
	{
		print("a")

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
		print("b")

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
		let r = CGRect(x: 0, y: 0, width: 200, height: 200)
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

let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
//
container.backgroundColor = UIColor.green

let vcA = myPgVC(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal)

let vA = vcA.view
vA?.frame = CGRect(x: 20, y: 20, width: 200, height: 200)

vA?.isUserInteractionEnabled = false

container.addSubview(vA!)

let vcB = myPgVC(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal)

let vB = vcB.view
vB?.frame = CGRect(x: 20, y: 240, width: 200, height: 200)
container.addSubview(vB!)


PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true


