import 'package:get/get.dart';
import 'package:i_eats/data/repository/auth_repo.dart';
import 'package:i_eats/models/response_model.dart';
import 'package:i_eats/models/signup_body_model.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

   Future<ResponseModel> registration(SignupBody signupBody) async {
    _isLoading = true;
    update(); //same as setState(){}
    Response response = await authRepo.registration(signupBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      //success response

      //save token obtained from the server
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    }
    else{
      //error response
      print("----->[AuthController] My Response is :${response.body['errors'][0]["message"]}");
      responseModel = ResponseModel(false, response.body['errors'][0]["message"]);
    }
    _isLoading = false;
    update(); //same as setState(){}
    return responseModel;
   }

  Future<ResponseModel> login(String email, password) async {
     //print("----->[AuthController] Getting token");
     //print("----->[AuthController] Token: "+authRepo.getUserToken().toString());

    _isLoading = true;
    update(); //same as setState(){}
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      //success response

      //save token obtained from the server
      //print("----->[AuthController] Backend Token");
      authRepo.saveUserToken(response.body["token"]);
      await authRepo.updateToken();
      print("----->[AuthController] TOKEN IS: \n "+response.body["token"].toString());
      responseModel = ResponseModel(true, response.body["token"]);
    }
    else{
      //error response
      print("----->[AuthController] My Response is :${response.body['errors'][0]["message"]}");
      responseModel = ResponseModel(false, response.body['errors'][0]["message"]);
    }
    _isLoading = false;
    update(); //same as setState(){}
    return responseModel;
  }

  saveUserNumberAndPassword(String number, String password) {
     authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
     return authRepo.userLoggedIn();
  }

  /// clear all data from shared preferences.
  bool clearSharedData(){
     return authRepo.clearSharedData();
  }

  /// FCM Notifications

  Future<void> updateToken() async{
     await authRepo.updateToken();
  }


}