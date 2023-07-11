import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      
      //message channel...
      let controller: FlutterViewController = window?.rootViewController as!
      FlutterViewController
      let channel = FlutterBasicMessageChannel(
        name: "myMessageChannel",
        binaryMessenger: controller.binaryMessenger,
        codec: FlutterStringCodec.sharedInstance()
      )
      channel.setMessageHandler {
          (message: Any?, reply: FlutterReply) -> Void in
          reply("Hi from iOS")
          channel.sendMessage("Hello i am ios native") {
              (reply: Any?) -> Void in
              print("$@",reply as! String)
          }
      }
      
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
