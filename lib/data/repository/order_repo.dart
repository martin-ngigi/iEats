import 'package:i_eats/models/place_order_model.dart';
import 'package:i_eats/utils/app_constants.dart';

import '../api/api_client.dart';
import 'package:get/get.dart';

class OrderRepo{
  final ApiClient apiClient;
  OrderRepo ({required this.apiClient});

  Future<Response> placeOrder(PlaceOrderBody placeOrder) async {
    return await apiClient.postData(AppConstants.PLACE_ORDER_URI, placeOrder.toJson());
  }
}