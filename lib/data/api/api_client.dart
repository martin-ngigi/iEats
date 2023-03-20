import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  late String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
   baseUrl = appBaseUrl;
   timeout = Duration(seconds: 30);
   token =AppConstants.TOKEN;
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

  Future<Response> getData(String uri) async{
    try{
      Response response = await get(uri); // "get(uri)" is the HTTP GET request
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