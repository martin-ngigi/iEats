import 'dart:convert';

import 'package:i_eats/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';


class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String>  cart = [];

  void addToCartList(List<CartModel> cartList){
    //empty global list
    cart = [];
    //convert objects to string because sp only accepts string data type
    //shared p only takes strings, so get each item in string and save it to the cart
    /* cartList.forEach((element) {
       return cart.add(jsonEncode(element));
    });*/
    //or
    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print("----->[cart_repo], SHARED - PREFERENCE addToCartList:"+sharedPreferences.getStringList(AppConstants.CART_LIST).toString());

    getCartList();

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
}