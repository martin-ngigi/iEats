import 'package:get/get.dart';
import 'package:i_eats/models/order_model.dart';
import 'package:i_eats/models/place_order_model.dart';

import '../data/repository/order_repo.dart';

class OrderController extends GetxController implements GetxService{
  OrderRepo orderRepo;
  OrderController({required this.orderRepo});
  bool _isLoading = false;

  late List<OrderModel> _currentOrderList;
  late List<OrderModel> _historyOrderList;

  bool get isLoading => _isLoading;

  List<OrderModel> get currentOrderList => _currentOrderList;
  List<OrderModel> get historyOrderList => _historyOrderList;

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

  Future<void> getOrderList() async{
    _isLoading = true;

    Response response = await orderRepo.getOrderList();
    if(response.statusCode==200){
      /// success response
      _historyOrderList = [];///clear
      _currentOrderList = [];

      /// get all list data and put it in order model
      response.body.forEach((order){
        OrderModel orderModel = OrderModel.fromJson(order);
        /// check current status
        if(orderModel.orderStatus == "pending" ||
          orderModel.orderStatus == "accepted" ||
          orderModel.orderStatus == "processing" ||
          orderModel.orderStatus == "handover" ||
          orderModel.orderStatus == "delivered" ){
          /// add it to current
          _currentOrderList.add(orderModel);
        }
        else{
          /// add it to history
          _historyOrderList.add(orderModel);
        }
      });
    }
    else{
      /// failed
      _historyOrderList = [];///clear
      _currentOrderList = [];
    }
    _isLoading  = false;
    // print("------>[OrderController]The length current of orders is:${_currentOrderList.length} ");
    // print("------>[OrderController]The length history of orders is:${_historyOrderList.length} ");
    update();
  }
}