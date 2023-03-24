import 'package:get/get.dart';
import 'package:i_eats/data/api/api_client.dart';
import 'package:i_eats/models/signup_body_model.dart';
import 'package:i_eats/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignupBody signupBody) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signupBody.toJson());
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None"; //if toke doesnt exist, return "None"
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email":email, "password":password});
  }

  Future<bool> saveUserToken(String token) async {
    //update token
    apiClient.token = token;
    //update header
    apiClient.updateHeader(token);

    //save in sharedPreferences
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try{
       await sharedPreferences.setString(AppConstants.PHONE, number);
       await sharedPreferences.setString(AppConstants.PASSWORD, password);

    }
    catch(e){
      throw e;
    }
  }

  /// clear all data from shared preference
  bool clearSharedData(){
    /**
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
     */
    /// above can ve replaced with the following
    sharedPreferences.clear();

    apiClient.token = '';
    apiClient.updateHeader('');


    return true;
  }
}