# Ottu

The Ottu is iOS SDK makes it quick and easy to build an excellent payment experience in your iOS app. We provide powerful and customizable UI screens and elements that can be used out-of-the-box to collect your user's payment details. We also expose the low-level APIs that power those UIs so that you can build fully custom experiences.

## Features

**Simplified security**: We make it simple for you to collect sensitive data such as credit card numbers and remain PCI compliant. This means the sensitive data is sent directly to Stripe instead of passing through your server.

**Apple Pay**: We provide a seamless integration with Apple Pay.

**Native UI**: We provide native screens and elements to collect payment details.

<p float="left">
<img src="https://github.com/Maninder1991/screens/blob/main/Cardfree.png" alt="PaymentUI" align="center"  width="200" height="400"/>
<img src="https://github.com/Maninder1991/screens/blob/main/WithCardPayment.png" alt="PaymentUI" align="center"  width="200" height="400"/>

**Localized**: We support the following localizations: English, Arabic.

#### Recommended usage

If you're selling digital products or services that will be consumed within your app, (e.g. subscriptions, in-game currencies, game levels, access to premium content, or unlocking a full version), you must use Apple's in-app purchase APIs. See the [App Store review guidelines](https://developer.apple.com/app-store/review/guidelines/#payments) for more information.

#### Privacy

The Ottu SDK collects data to help us improve our products and prevent fraud. This data is never used for advertising and is not rented, sold, or given to advertisers.

## Requirements

The Ottu requires Xcode 13.0 or later and is compatible with apps targeting iOS 12 or above.

## Getting started

To initialize the SDK you need to create session token. 
You can create session token with our public API [Click here](https://docs-ottu.gitbook.io/o/developer/rest-api/authentication#public-key) to see more detail about our public API.
    
Installation
==========================

#### Installation with CocoaPods

***Ottu:*** Ottu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Ottu'
```

#### Installation with Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/ottuco/ottu-ios-sdk.git")
]
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate Ottu into your project manually by downloading project and keep the source folder in your project.


*Swift 5.1, 5.0, 4.2, 4.0*

In ViewController.swift, just import Ottu framework and initalize Ottu SDK.

```swift
import Ottu

class ViewController: UIViewController,OttuDelegate {

    var responseDict : [String:Any]?
    var message = ""
    
    //apikey: You will get the apikey from Ottu
    //merchant_id: You will get the merchant id from Ottu
    //sessionid: You will get the sessionid from the public API
    //lang: This is for language. "en" for English and "ar" for Arabic
    override func viewDidLoad() {
        super.viewDidLoad()
        //Intiate the SDK accordingly after getting session id from the public API documentation.
        //session_id - It is generated when payment was created. See API documentation
        //merchant_id - Merchant domain. See API documentation.
        //apiKey - API Public key should be used. See API documentation.
        //lang - You can use it to change the language. We support two languages english and arabic. You can use "en" for english and "ar" for arabic.        
        let session_id = "ENTER_YOUR_SESSION_ID"
        _ = Ottu.init(session_id, merchant_id: "MERCHANT_ID", apiKey: "API_KEY" ,lang: "ENTER_LANGUAGE_ID_en_or_ar", viewController: self, delegate: self)
    }
    
    //The error callback is invoked when problems occur during a payment.
    //Reason will be defined in the response attribute. 
    func errorCallback(message: String, response: [String : Any]?) {
        responseDict = response
        self.message = "Error"
        self.dismissed()

    }
    
    //Called when a customer cancels the payment.
    func cancelCallback(message: String, response: [String : Any]?) {
        responseDict = response
        self.message = "Cancel"
        self.dismissed()
    }
    
    //Called when the payment completed successfully.
    func successCallback(message: String, response: [String : Any]?) {
        responseDict = response
        self.message = "Success"
        self.dismissed()
    }
    
    //It is a helper function that has to return a promise object, to create the redirect_url.
    //This allows the merchant to redirect the user to the cart page and wait for a while before creating the redirect_url. 
    //In case the customer changes items in the cart, the due amount will be updated accordingly, then the merchant will wait for a while until the customer does not return, then the function returns a promise object, the cart will be frozen and marked as submitted, and the redirect_url will be generated.
    func beforeRedirect() {
        
    }
    
    //After successCallback or cancelCallback or errorCallback you can show alert to the user accordingly.
    func dismissed() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            let alert = UIAlertController(title: self.message.capitalized, message: "\(String(describing: self.responseDict))", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
```
## Inetgrate Apple pay


Please follow below steps to integrate apple pay button in storyboard
<p float="left">
<img src="https://github.com/Maninder1991/screens/blob/main/step1.png" alt="ApplePay" align="center"/>
<img src="https://github.com/Maninder1991/screens/blob/main/step2.png"  alt="ApplePay" align="center"/>

Now Create a action for the button and initalise the SDK with session id.

```swift

let session_id = "ENTER_YOUR_SESSION_ID"
_ = Ottu.init(session_id, merchant_id: "MERCHANT_ID", apiKey: "API_KEY" ,lang: "ENTER_LANGUAGE_ID_en_or_ar",formsOfPayment: ["applePay"], viewController: self, delegate: self)

```

**Note**: You need to pass formsOfPayment as ["applePay"]. If it is not passed then normal flow will start working.


**Note**: To inetgrate apple pay you need to enable apple pay in capabilites in your project. 


## Licenses

- [Ottu License](LICENSE)
