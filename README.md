# CallbackURLKitReceiverSample

This is an example of using CallbackURLKit (https://github.com/phimage/CallbackURLKit) when you need your own receiver and sender programs.

The sender looks like: 


![](/Images/sender_main.png)

The receiver looks like: 


![](/Images/receiver_main.png)

The realization of success callback in the sample:
```swift
Manager.executeSuccessCallback(returnParams: ["successTextFromReceiver": textfieldSendSuccessText.text ?? ""])
```

The realization of failure callback in the sample:
```swift
Manager.executeFailureCallback(error: AnyError.buttonFailureError)
```

The realization of cancel callback in the sample:
```swift
Manager.executeCancelCallback()
```


This is the receiver part of sample. 

You can find the second part of example here: 

https://github.com/freakdragon/CallbackURLKitSenderSample

The source of CallbackURLKit is here too because I had to change access to some functions to public.

