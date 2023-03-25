import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  late String appBaseUrl;
  late SharedPreferences sharedPreferences;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}){
   baseUrl = appBaseUrl;
   timeout = Duration(seconds: 30);
   // token = AppConstants.TOKEN;
   token = sharedPreferences.getString(AppConstants.TOKEN)??"";

   _mainHeaders = {
     "Content-Type": "application/json; charset=UTF-8",
     "Authorization": "Bearer $token",
   };
  }

  void updateHeader(String token ){
    _mainHeaders = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async{ //{Map<String, String>? headers} is an optional argument
    try{
      Response response = await get(
          uri,
        headers: headers??_mainHeaders // if headers is empty, then use _mainHeaders
      ); // "get(uri)" is the HTTP GET request
      return response;
    }
    catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //sending data to the server
  Future<Response> postData(String uri, dynamic body) async {
    print("1. "+body.toString());
    try{
      Response response = await post(uri, body, headers: _mainHeaders);
      print("1. "+response.toString());
      return response;
    }
    catch(e){
      print(e.toString());
      return Response(statusCode: 1, statusText: "Error getting data:: "+e.toString());
    }
  }
}