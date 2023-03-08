import 'package:get/get.dart';
import 'package:i_eats/data/api/api_client.dart';

import '../../utils/app_constants.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    //http://mvs.bslmeiyu.com/api/v1/products/recommended
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}