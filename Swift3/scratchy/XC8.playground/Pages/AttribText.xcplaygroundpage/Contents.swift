
import UIKit
import PlaygroundSupport


let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
//
container.backgroundColor = UIColor.green

let myLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 400, height: 40))

// create attributed string
let myString = "Swift Attributed String"
let myAttribute = [ NSForegroundColorAttributeName: UIColor.red ]
var myAttrString = NSMutableAttributedString(string: myString, attributes: myAttribute)

myAttrString.addAttribute(NSStrikethroughStyleAttributeName, value: 12, range: NSRange(location: 5, length: 8))

myAttrString.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 20), range: NSRange(location: 5, length: 8))

// set attributed text on a UILabel
myLabel.attributedText = myAttrString

//myLabel.backgroundColor = UIColor.cyan

container.addSubview(myLabel)

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true


//NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@",strMRP,strOffer]];
//
//[attributeString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(0, strMRP.length)];
//
//[attributeString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:NSMakeRange(strMRP.length, strOffer.length+1)];
//
//[attributeString addAttribute:NSStrikethroughStyleAttributeName
//	value:[NSNumber numberWithInteger: NSUnderlineStyleDouble]
//	range:NSMakeRange(0,strMRP.length)];
//
