import UIKit
import Flutter

// Import this google dependency
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)

    /**
    * Add This google map key here
    API KEY FOR iOS Only is: AIzaSyDnyW47ZnMaCi0sNgUfAbe4lWIZmTh7O1A
    API KEY FOR  all devices is: AIzaSyDIcs-cXjaLkxO4FHUXdAJsUSXG4UjuvWE
    */
   GMSServices.provideAPIKey("AIzaSyDIcs-cXjaLkxO4FHUXdAJsUSXG4UjuvWE") // Key obtained from https://console.cloud.google.com/google/maps-apis/credentials?project=ieats-381804

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
