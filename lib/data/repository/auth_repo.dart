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

  saveUserToken(String token) async {
    //update token
    apiClient.token = token;
    //update header
    apiClient.updateHeader(token);

    //save in sharedPreferences
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}