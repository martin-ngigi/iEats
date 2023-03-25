import 'package:get/get.dart';
import 'package:i_eats/data/repository/user_repo.dart';
import 'package:i_eats/models/user_model.dart';

import '../models/response_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo
  });

  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    print("------> [UserController] TEST RESPONSE IS: ${response.body}");
    if (response.statusCode == 200) {
      //success response
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    }
    else {
      //error response
      print("------> [UserController], didnt get user data. Error is : ${response.statusText!}");
      responseModel = ResponseModel(false, response.statusText!);
    }
    update(); //same as setState(){}
    return responseModel;
  }
}