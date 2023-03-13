import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:i_eats/data/repository/cart_repo.dart';
import 'package:i_eats/models/product.dart';

import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  //only for storage and shared preferences
  List<CartModel> storageItems = [];

  void addItem(ProductModel product, int quantity){
    //print("Length/Number of items is "+_items.length.toString());
    var totalQuantity = 0;
    if(_items.containsKey(product.id!)){
      //update the exist cart count
      _items.update(product.id!, (value){

        totalQuantity = value.quantity!+quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity!+quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      //  after updating, remove it fromcart
      if(totalQuantity<=0){
        _items.remove(product.id);
      }
    }
    else{
      //new cart entry...
      if(quantity>0){
        _items.putIfAbsent(product.id!, () {
          //print("Adding items to the cart ID: "+product.id!.toString()+" Quantity: "+quantity.toString()+" Name: "+ product.name!);
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      }
      else{
        //show message
        Get.snackbar("Item count", "You should at least add an item in the cart",
            backgroundColor: AppColors.mainColor,
            colorText: Colors.white
        );
      }
    }

    //addToCartList so as to be saved to sharedPreference
    cartRepo.addToCartList(getItems);

    update(); //same as setState(){}



  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    //else
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key ==  product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;

  }

  //getter to get all items in cart
  int get totalItems{
      var totalQuantity = 0;
      _items.forEach((key, value) {
        totalQuantity += value.quantity!; //increment i.e. i=i+1;

      });

      return totalQuantity;
  }

  //getter
  List<CartModel> get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  //getter for total price
  int get totalAmount{
    var total = 0;

    _items.forEach((key, value) {
      //total item for all items
      total += value.quantity!*value.price!;
    });

    return total;
  }

  List<CartModel> getCartData(){
    setCart =cartRepo.getCartList();

    return storageItems;
  }

  //setter to set storageItems items
  set setCart(List<CartModel> items){
    storageItems = items;
    print("-----> [cart_controller] length of cart items in SharedPreference: "+storageItems.length.toString());
    for(int i=0; i<storageItems.length; i++){
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  //cart history
  void addToHistory(){
    cartRepo.addToCartHistoryList();

    //clear
    clear();
  }

  void clear(){
    //set _items map to an empty map
    _items ={};
    //update the UI .. same as setState(){}
    update();
  }

  List<CartModel> getCartHistoryList(){
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems){
    _items = {}; //make itempty
    _items = setItems;
  }

  void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();
  }
}