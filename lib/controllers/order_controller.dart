import 'package:get/get.dart';
import 'package:i_eats/models/place_order_model.dart';

import '../data/repository/order_repo.dart';

class OrderController extends GetxController implements GetxService{
  OrderRepo orderRepo;
  OrderController({required this.orderRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> placeOrder(PlaceOrderBody placeOrder, Function callback) async{
    _isLoading = true;
    Response response = await orderRepo.placeOrder(placeOrder);
    if(response.statusCode == 200){
      _isLoading = false;
      String message = response.body['message'];
      String orderID = response.body['order_id'].toString();

      callback(true, message, orderID);
    }
    else{
      callback(true, "Error placing an order. Hint : ${response.statusText}", '-1');

    }
  }
}