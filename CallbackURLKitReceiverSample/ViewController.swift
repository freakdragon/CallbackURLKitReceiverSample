//
//  ViewController.swift
//  InteractiveReceiverTest
//
//  Created by Admin on 07.07.17.
//  Copyright © 2017 LAN-Optic, LLC. All rights reserved.
//

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

