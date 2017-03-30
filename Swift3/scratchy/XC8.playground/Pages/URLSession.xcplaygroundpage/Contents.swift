import UIKit
import PlaygroundSupport

class ViewController:UIViewController{
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
}

//let vc = ViewController()
//vc.view.backgroundColor = UIColor.blue
//
//
//let container = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
//
//
//container.backgroundColor = UIColor.white
//let square = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
//square.backgroundColor = UIColor.red
//
//container.addSubview(square)

//UIView.animateWithDuration(5.0, animations: {
//	square.backgroundColor = UIColor.blueColor()
//	let rotation = CGAffineTransformMakeRotation(3.14)
//	square.transform = rotation
//	
//})


//PlaygroundPage.current.liveView = container
//
PlaygroundPage.current.needsIndefiniteExecution = true




let newCompanyStockSymbol = "MSFT"

var newCompanyStockPrice = ""

let newStr = "https://query.yahooapis.com/v1/public/yql?q=select%20symbol%2C%20Ask%2C%20YearHigh%2C%20YearLow%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22\(newCompanyStockSymbol)%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"

var url = URL(string: "https://emergency-phone-numbers.herokuapp.com")!

url = URL(string: newStr)!

let session = URLSession.shared
let q = session.dataTask(with: url) { data, response, error in
	

	do {
		if let d = data, let dictionary = try JSONSerialization.jsonObject(with: d, options: []) as? [String: AnyObject] {
			print(dictionary)
		}
	} catch {
		print("Error \(error)")
	}
}
q.resume()
