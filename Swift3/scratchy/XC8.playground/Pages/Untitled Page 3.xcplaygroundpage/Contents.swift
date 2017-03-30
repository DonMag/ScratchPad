//: [Previous](@previous)

import Foundation
import CoreLocation
import MapKit
import Contacts

var str = "Hello, playground"

//: [Next](@next)


let coords = CLLocationCoordinate2DMake(40.7483, -73.984911)

let address = [CNPostalAddressStreetKey: "350 5th Avenue",
	CNPostalAddressCityKey: "New York",
	CNPostalAddressStateKey: "NY",
	CNPostalAddressPostalCodeKey: "10118",
	CNPostalAddressCountryKey: "US"];

let place = MKPlacemark(coordinate: coords, addressDictionary: address)

let adct = place.addressDictionary

let sZip = place.addressDictionary![CNPostalAddressPostalCodeKey]


var longitude :CLLocationDegrees = -122.0312186
var latitude :CLLocationDegrees = 37.33233141

var location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
print(location)

let geoCoder = CLGeocoder()
var placemark: AnyObject
var error: NSError
print("here1")
geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemark, error) -> Void in
	print("here")
	if error != nil {
		print("Error: \(error!.localizedDescription)")
		return
	}
	if placemark!.count > 0 {
		let pm = placemark![0] as CLPlacemark
		//self.locationLabel.text = "\(pm.locality), \(pm.country)"
	} else {
		print("Error with data")
	}
})

CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
//	print(location)
	
	if error != nil {
		print("Reverse geocoder failed with error" + error!.localizedDescription)
		return
	}
	
	if placemarks!.count > 0 {
		let pm = placemarks![0] 
		print(pm.locality)
	}
	else {
		print("Problem with the data received from geocoder")
	}
})

//NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//formatter.numberStyle = NSNumberFormatterCurrencyStyle;
//formatter.locale = [NSLocale localeWithLocaleIdentifier:@"nl_NL"];
//NSNumber *number = [formatter numberFromString:@"40"];

let formatter = NSNumberFormatter()
formatter.numberStyle = .CurrencyStyle
formatter.locale = NSLocale(localeIdentifier: "nl_NL")
let s = formatter.stringFromNumber(21)
formatter.numberFromString("€ 21,00")
formatter.numberFromString("€ 21")


let words = ["Cat", "Chicken", "fish", "Dog",
	"Mouse", "Guinea Pig", "monkey"]

let ch = "O"

//{$0.videoTitle.rangeOfString(lower) != nil}
let fwords = words.filter({$0.rangeOfString(ch, options: NSStringCompareOptions.CaseInsensitiveSearch) != nil})

print(fwords)

var strVal = "1234.98"
var nVal = 0
