import 'package:get/get.dart';
import 'package:i_eats/routes/route_helper.dart';

import '../../base/show_custom_snackbar.dart';

class ApiChecker{
  static void checkApi(Response response){
    /// check if user has logged in
    if(response.statusCode == 401){
      /// user dont have authorization i.e. user should have logged in
      Get.offNamed(RouteHelper.getSignInPage());
    }
    else{
      showCustomSnackBar(response.statusText!);
    }
  }

}