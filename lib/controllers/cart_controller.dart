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
}