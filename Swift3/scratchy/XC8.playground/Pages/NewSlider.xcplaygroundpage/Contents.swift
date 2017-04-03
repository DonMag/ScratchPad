
import UIKit
import PlaygroundSupport


let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
//
container.backgroundColor = UIColor.green

PlaygroundPage.current.liveView = container



public extension UIImage {
	public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
		let rect = CGRect(origin: .zero, size: size)
		UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
		color.setFill()
		UIRectFill(rect)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		guard let cgImage = image?.cgImage else { return nil }
		self.init(cgImage: cgImage)
	}
}

class MySlider: UISlider {
	
//	override func trackRect(forBounds bounds: CGRect) -> CGRect {
//		var r = super.trackRect(forBounds: bounds)
//		r.origin.x = 0
//		r.size.width = bounds.width - 50
//		return r
//	}

}


var clearThumb = UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))

var imgMax = UIImage(named: "slider-track")
var iMin = UIImage(named: "slider-track-fill")

var imgMin = iMin?.resizableImage(
	withCapInsets: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
)

var cSlider = MySlider()
cSlider.frame.origin.x = 40
cSlider.frame.origin.y = 20
cSlider.frame.size.width = 330

cSlider.setValue(0.5, animated: false)

cSlider.backgroundColor = UIColor.yellow

cSlider.setThumbImage(clearThumb, for: .normal)

cSlider.setMinimumTrackImage(imgMin, for: .normal)
cSlider.setMaximumTrackImage(imgMax, for: .normal)


container.addSubview(cSlider)



