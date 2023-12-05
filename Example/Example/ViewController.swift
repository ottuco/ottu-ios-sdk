//
//  ViewController.swift
//  Example
//
//  Created by Maninder Singh on 04/09/22.
//

import UIKit
import Ottu
import ApplePayButton

class ViewController: UIViewController {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var applePayButton: ApplepayButton!
    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var customerIdTF: UITextField!
    @IBOutlet weak var apiKeyTF: UITextField!
    @IBOutlet weak var languageTF: UITextField!
    @IBOutlet weak var merchantIdTf: UITextField!
    @IBOutlet weak var payButton: UIButton!
    
    
    //MARK: - Variables -
    var responseDict : [String:Any]?
    var message = ""
    
    //TODO: - Set URLs
    var Base_URL = "BASE_URL"
    var Disclouser_URL = "DISCLOSURE_URL"
    var Redirect_URL = "REDIRECT_URL"
    var PGCodes = [String]()
    var CurrencyCode = "CURRENCY_CODE"
    
    //MARK: - VC Methods -
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK: - IBActions -
    @IBAction func applePayButton(_ sender: Any) {
        if Base_URL == "BASE_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your base URL")
            return
        }
        if Disclouser_URL == "DISCLOSURE_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your disclouser URL")
            return
        }
        if Redirect_URL == "REDIRECT_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your redirect URL")
            return
        }
        if CurrencyCode == "CURRENCY_CODE"{
            self.showAlert(title: "Validation Error", message: "Enter your currency code")
            return
        }
        if amountTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "Amount cannot be empty")
            return
        }
        if apiKeyTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "API key cannot be empty")
            return
        }
        if customerIdTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "Customer Id cannot be empty")
            return
        }
        if languageTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "language should be en or ar")
            return
        }
        if merchantIdTf.isEmpty{
            self.showAlert(title: "Validation Error", message: "Merchant ID cannot be empty")
            return
        }
        if PGCodes.isEmpty{
            self.showAlert(title: "Validation Error", message: "PGCodes cannot be empty")
            return
        }
        //TODO: - Set Paramters accordingly
        var params = [String : Any]()
        params["type"] = "e_commerce"
        params["pg_codes"] = PGCodes
        params["amount"] = amountTF.text ?? ""
        params["currency_code"] = CurrencyCode
        params["disclosure_url"] = Disclouser_URL
        params["redirect_url"] = Redirect_URL
        params["customer_id"] = customerIdTF.text ?? ""
        params["expiration_time"] = "30000"
        
        //TODO: - Set Headers accordingly
        var headers = [String:String]()
        headers["Authorization"] = "Api-Key \(apiKeyTF.text ?? "")"
        headers["Content-Type"] = "application/json"

        
        getTokenApplePay(params: params, headers: headers,base_url :self.Base_URL)
    }
    
    @IBAction func stcPayButton(_ sender: Any) {
        if Base_URL == "BASE_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your base URL")
            return
        }
        if Disclouser_URL == "DISCLOSURE_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your disclouser URL")
            return
        }
        if Redirect_URL == "REDIRECT_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your redirect URL")
            return
        }
        if CurrencyCode == "CURRENCY_CODE"{
            self.showAlert(title: "Validation Error", message: "Enter your currency code")
            return
        }
        if amountTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "Amount cannot be empty")
            return
        }
        if apiKeyTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "API key cannot be empty")
            return
        }
        if customerIdTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "Customer Id cannot be empty")
            return
        }
        if languageTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "language should be en or ar")
            return
        }
        if merchantIdTf.isEmpty{
            self.showAlert(title: "Validation Error", message: "Merchant ID cannot be empty")
            return
        }
        if PGCodes.isEmpty{
            self.showAlert(title: "Validation Error", message: "PGCodes cannot be empty")
            return
        }
        //TODO: - Set Paramters accordingly
        var params = [String : Any]()
        params["type"] = "e_commerce"
        params["pg_codes"] = PGCodes
        params["amount"] = amountTF.text ?? ""
        params["currency_code"] = CurrencyCode
        params["disclosure_url"] = Disclouser_URL
        params["redirect_url"] = Redirect_URL
        params["customer_id"] = customerIdTF.text ?? ""
        params["expiration_time"] = "30000"
        
        //TODO: - Set Headers accordingly
        var headers = [String:String]()
        headers["Authorization"] = "Api-Key \(apiKeyTF.text ?? "")"
        headers["Content-Type"] = "application/json"

        
        getTokenSTCPay(params: params, headers: headers,base_url :self.Base_URL)
    }
    
    @IBAction func startButton(_ sender: Any) {
        if Base_URL == "BASE_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your base URL")
            return
        }
        if Disclouser_URL == "DISCLOSURE_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your disclouser URL")
            return
        }
        if Redirect_URL == "REDIRECT_URL"{
            self.showAlert(title: "Validation Error", message: "Enter your redirect URL")
            return
        }
        if CurrencyCode == "CURRENCY_CODE"{
            self.showAlert(title: "Validation Error", message: "Enter your currency code")
            return
        }
        if amountTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "Amount cannot be empty")
            return
        }
        if apiKeyTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "API key cannot be empty")
            return
        }
        if customerIdTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "Customer Id cannot be empty")
            return
        }
        if languageTF.isEmpty{
            self.showAlert(title: "Validation Error", message: "language should be en or ar")
            return
        }
        if merchantIdTf.isEmpty{
            self.showAlert(title: "Validation Error", message: "Merchant ID cannot be empty")
            return
        }
        if PGCodes.isEmpty{
            self.showAlert(title: "Validation Error", message: "PGCodes cannot be empty")
            return
        }
        //TODO: - Set Paramters accordingly
        var params = [String : Any]()
        params["type"] = "e_commerce"
        params["pg_codes"] = PGCodes
        params["amount"] = amountTF.text ?? ""
        params["currency_code"] = CurrencyCode
        params["disclosure_url"] = Disclouser_URL
        params["redirect_url"] = Redirect_URL
        params["customer_id"] = customerIdTF.text ?? ""
        params["expiration_time"] = "30000"
        
        //TODO: - Set Headers accordingly
        var headers = [String:String]()
        headers["Authorization"] = "Api-Key \(apiKeyTF.text ?? "")"
        headers["Content-Type"] = "application/json"

        
        getToken(params: params, headers: headers,base_url :self.Base_URL)
    }
    
    
    //MARK: - Custom Methods -
    
    func showAlert(title:String ,message :String){
        let alert = UIAlertController(title: title.capitalized, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}



//MARK: - API Calls -
extension ViewController{
    
    func getToken(params:[String:Any],headers: [String:String],base_url:String){
        Token.shared.getToken(params: params, headers: headers, base_URL: base_url) { success, sessionId, errorMessage in
            if success{
                _ = Ottu.init(sessionId ?? "", merchant_id: self.merchantIdTf.text ?? "", apiKey: self.apiKeyTF.text ?? "" ,lang: self.languageTF.text ?? "", viewController: self, delegate: self)
            }else{
                self.showAlert(title: "Error", message: errorMessage ?? "")
            }
        }
    }
    
    func getTokenApplePay(params:[String:Any],headers: [String:String],base_url:String){
        Token.shared.getToken(params: params, headers: headers, base_URL: base_url) { success, sessionId, errorMessage in
            if success{
                _ = Ottu.init(sessionId ?? "", merchant_id: self.merchantIdTf.text ?? "", apiKey: self.apiKeyTF.text ?? "" ,lang: self.languageTF.text ?? "",formsOfPayment: ["applePay"], viewController: self, delegate: self)
            }else{
                self.showAlert(title: "Error", message: errorMessage ?? "")
            }
        }
    }
    
    func getTokenSTCPay(params:[String:Any],headers: [String:String],base_url:String){
        Token.shared.getToken(params: params, headers: headers, base_URL: base_url) { success, sessionId, errorMessage in
            if success{
                _ = Ottu.init(sessionId ?? "", merchant_id: self.merchantIdTf.text ?? "", apiKey: self.apiKeyTF.text ?? "" ,lang: self.languageTF.text ?? "",formsOfPayment: ["stcPay"], viewController: self, delegate: self)
            }else{
                self.showAlert(title: "Error", message: errorMessage ?? "")
            }
        }
    }
    
    
    
}


//MARK: - Ottu Delegates -
extension ViewController : OttuDelegate{
    
    func errorCallback(message: String, response: [String : Any]?) {
        responseDict = response
        self.message = "Error"
        self.dismissed()

    }
    
    func cancelCallback(message: String, response: [String : Any]?) {
        responseDict = response
        self.message = "Cancel"
        self.dismissed()
    }
    
    func successCallback(message: String, response: [String : Any]?) {
        responseDict = response
        self.message = "Success"
        self.dismissed()
    }
    
    //If you want to freez your app UI before making final payment
    func beforeRedirect() {
        
    }
    
    func dismissed() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.showAlert(title: self.message.capitalized, message: "\(String(describing: self.responseDict))")
        }
    }
    
}
