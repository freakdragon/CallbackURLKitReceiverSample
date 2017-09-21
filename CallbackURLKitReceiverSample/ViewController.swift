//
//  ViewController.swift
//  CallbackURLKitReceiverSample
/*
The MIT License (MIT)
Copyright © 2017 Eugene Babich (freakdragon). 
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textfieldSendSuccessText: UITextField!
    @IBOutlet weak var labelTextFromSender: UILabel!

    @IBAction func buttonSuccessCallbackAction(_ sender: UIButton) {
        if((Manager.getCurAction() ?? "") == "sendText") {
            Manager.executeSuccessCallback(returnParams: ["successTextFromReceiver": textfieldSendSuccessText.text ?? ""])
        } else {
            Manager.executeFailureCallback(error: AnyError.noSendTextAction)
        }
    }
    
    @IBAction func buttonFailureCallbackAction(_ sender: UIButton) {
        Manager.executeFailureCallback(error: AnyError.buttonFailureError)
    }
    
    @IBAction func buttonCancelCallbackAction(_ sender: UIButton) {
        Manager.executeCancelCallback()
    }
    
    @IBAction func buttonGetTextFromSenderAction(_ sender: UIButton) {
        labelTextFromSender.text = Manager.getParametersDictionary()["textFromSender"] ?? "No text to show"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldSendSuccessText.layer.borderWidth = 1.0
        textfieldSendSuccessText.layer.cornerRadius = 3.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

