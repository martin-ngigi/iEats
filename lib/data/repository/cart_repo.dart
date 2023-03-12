import 'dart:convert';

import 'package:i_eats/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';


class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String>  cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList){
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);

    var time = DateTime.now().toString();
    //empty global list
    cart = [];
    //convert objects to string because sp only accepts string data type
    //shared p only takes strings, so get each item in string and save it to the cart
    /* cartList.forEach((element) {
       return cart.add(jsonEncode(element));
    });*/
    //or
    cartList.forEach((element){
      //with every order, group with same add time
      element.time = time;

      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print("----->[cart_repo], SHARED - PREFERENCE addToCartList:"+sharedPreferences.getStringList(AppConstants.CART_LIST).toString());

    //getCartList();

  }

  List<CartModel> getCartList(){
    List<String> carts =[];

    //checking if key exists
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      //get cart inform of string
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("----->[cart_repo], SHARED - PREFERENCE inside getCartList:"+carts.toString());

    }

    List<CartModel> cartList = [];

    //convert the strings to objects
    /* carts.forEach((element) {
       cartList.add(CartModel.fromJson(jsonDecode(element)));
     });*/
    //or
    carts.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));


    return cartList;
  }

  //get cart history
  List<CartModel> getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;

    }

    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;

    }

    for(int i =0; i< cart.length; i++){
      //print("----> [cart_repo] Cart history list"+cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
    
    print("----> [cart_repo] The length of history is : "+getCartHistoryList().length.toString());
    for(int j=0; j<getCartHistoryList().length; j++){
      print("The time for the order is "+getCartHistoryList()[j].time.toString());
    }
  }

  //remove items from cart
  void removeCart(){
    cart =[];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}