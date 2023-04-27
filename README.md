# i_eats

- [Martin Backend API Source code : ](https://github.com/martin-ngigi/iEats_backend)
- [YOUTUBE Tutorial](https://www.youtube.com/watch?v=7dAt-JMSCVQ&list=PL3nPgdhXQtHfgtMpD_0EvJm-8LP3uNfc-&index=1&ab_channel=dbestech)
- [DBESTECH](https://www.dbestech.com/tutorials/flutter-food-delivery-app-e-commerce-for-ios-and-android)
- [Youtube fans starter code](https://www.dbestech.com/food_delivery.zip)
- [Backend code here](https://github.com/dastagir-ahmed/flutter-ecommerce-app-food-delivery)
- [Install backend](https://www.dbestech.com/tutorials/how-to-install-laravel-on-mac-os)
- [E-commerce app documentation](https://www.dbestech.com/tutorials/flutter-food-delivery-e-commerce-app-documentation)
- [Json to Dart conversion](https://javiercbk.github.io/json_to_dart/)
- [Popular products endpoint](http://mvs.bslmeiyu.com/api/v1/products/popular)
- [PayPal Integration Documentation](https://www.dbestech.com/tutorials/flutter-paypal-payment-integration-with-webview)
- [Paypal Sandbox account | Secret ID and Client ID create for app development testing  youtube tutorial](https://www.youtube.com/watch?v=YtVHW_b6s2c)
- [Paypal tools/dashboard](https://developer.paypal.com/tools/ || https://www.paypal.com/mep/dashboard)
- [Paypal rest APIs](https://developer.paypal.com/api/rest/)

## Short-Cuts
- To find a certain key word globally, press:
```
ctrl + shift + F
```

- To rename a word globally: 
```
shift + F6
```

## Install Laravel on Mac and Windows OS
- [Link to installing laravel by dbesteck](https://www.dbestech.com/tutorials/how-to-install-laravel-on-mac-os)
- There are four steps to do it.
1. Install Homebrew
2. Install PHP
3. Install Composer
4. Install Laravel
<br>
- or installation from the official documentation
- [laravel installation](https://laravel.com/docs/10.x/installation)
- []

## API KEYs
- Google map Android key: AIzaSyB9txBevFfFt2ENt4pvW8-Ch6PWfyxHsNo
- Google map iOS key: AIzaSyDnyW47ZnMaCi0sNgUfAbe4lWIZmTh7O1A
- Google map All devices key: AIzaSyDIcs-cXjaLkxO4FHUXdAJsUSXG4UjuvWE
- DBESTECH Google map ;-) key: AIzaSyCMESvjp3G5FtPnukZ28_GVOuFSvEhSS9c


## How to set the port of Chrome when running "flutter run -d chrome" for localStorage?
```
flutter run -d chrome --web-port 8080
```

# Access flutter localhost from real mobile browser
- In your terminal, inside the project folder:
```
flutter build web
```
- Compiling lib/main.dart for the Web... 34.5s
```
cd build/web
python3 -m http.server 8000
```
- Then in a new terminal tab:
```
ngrok http 8000
```


# Sample error message
```
Route [login] not defined.
```
- The above error is caused by errors in the headers...

## Install latest Ruby version:
- Use following documentation for Ruby installation... Ruby will be used to run iOS emulator.
- [Ruby Installation](https://mac.install.guide/ruby/13.html)

## Running on iOS
- While inside The projectDirectory, navigate to iOS directory
```
cd ios
```
- Install Pod pod file [Should only be installed once, ignore if pod file already exists]
```
pod install
```
- Run the app on iOS device by running following commands:
```
flutter clean
flutter run
```

## Obtaining package name:
- iOS:
- In iOS the package name is the bundle identifier in Info.plist. which is found in Runner.xcodeproj/project.pbxproj:

      PRODUCT_BUNDLE_IDENTIFIER = com.example.iEats;
- place the GoogleService-Info.plist  inside iOS/Runner <br>
- Android:
- In Android the package name is in the AndroidManifest:

      <manifest xmlns:android="http://schemas.android.com/apk/res/android"
       ...
       package="com.example.i_eats"> 
- place the google-service.json  inside android/app <br>

## Obtaining google maps API Key
1. URLS
- [Tutorial link to obtaining Google Map API Key](https://www.youtube.com/watch?v=HCUZ91NVnaM)
- [Open Google cloud console](https://console.cloud.google.com/)
- [iEats Dashboard](https://console.cloud.google.com/home/dashboard?project=ieats-381804)
- [DBESTECH documentation](https://www.dbestech.com/tutorials/generate-google-map-api-key-android-ios-integrate-in-flutter-amp-react-native)
- Enable Geocoding API, Geolocation API, Maps SDK for Android, Maps SDK for iOS

## Generating SHA-1 for android:
- Navigate to Android folder inside project:
```
cd android
```
- Then generate SHA-1 in MAC / Linux
```
./gradlew signingReport
```
- Then generate SHA-1 in Windows
```
gradlew signingReport
```


## Paypal integration:
- Create a business paypal account
- [PayPal Integration Documentation](https://www.dbestech.com/tutorials/flutter-paypal-payment-integration-with-webview)
- [Sandbox > Accounts page](https://developer.paypal.com/developer/accounts)
- Android apk  <br>
paypal: ab@dbestech.com pass: 12345678 <br>
You may use the above paypal account for testing payment. It's a sandbox account. This apk does not contain all the features of commercial license.  <br>
- [Paypal developer account/ create sandbox account](https://developer.paypal.com/developer/accounts)

<br><br>
- My Email: martinwainaina002@gmail.com
- Paypal Sandbox Account: sb-wllwa15159589@business.example.com
- Paypal Client ID: Ab8dCglfrtHWB0gOxJvMdw5RqvG3X5EC2QrH9VRKKa-_wXldtZjIgRwejtqr8Kz-eB2CcljdqpmdkzWr
- Secret key: EIL3gdug3RgJvVWhD-e1NeXO_Yt-i6BljZmIenzhoXN9mngwY2o0022MVwu7JdRh_7PUDeUk4pLjZaJC 
