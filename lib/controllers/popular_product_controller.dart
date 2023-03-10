import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_eats/controllers/cart_controller.dart';
import 'package:i_eats/data/repository/popular_product_repo.dart';
import 'package:i_eats/utils/colors.dart';

import '../models/product.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  
  List<dynamic> _popularProductList = []; //"_" means its private
  List<dynamic> get popularProductList => _popularProductList; //make the private _popularProductList public
  late CartController _cart;

  bool _isLoaded = false;//private
  bool get isLoaded => _isLoaded;//public getter

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems +  _quantity;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      //print("----------->Got products");
      _popularProductList =[];//clear data
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print("-------> Popular products: $_popularProductList");
      _isLoaded = true;
      update(); //similar to set state
    }
    else{

    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
      print("---> Increase number of items to: "+_quantity.toString());
    }
    else{
      _quantity = checkQuantity(_quantity-1);
      print("---> Drcreased number of items to: "+_quantity.toString());
    }

    update(); //same as setState(){}
  }

  int checkQuantity(int quantity){
    // quantity should not be less than 0 or 20
    if((_inCartItems+quantity)<0){
      //show message
      Get.snackbar("Item count", "You cant reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white
      );
      return 0;
    }
    else if((_inCartItems+quantity)>20){
      Get.snackbar("Item count", "You can't add more!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white
      );
      return 20;
    }
    else{
      return quantity;
    }
  }

  //reset the cart count if its new product
  void initProduct(ProductModel product, CartController cart){
    _quantity =0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    //if exists
    //get from local storage _inCartItems
    print("Exists or not "+exist.toString());
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    print("The quantity in the cart is "+_inCartItems.toString());

  }

  void addItem(ProductModel product){

      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
       print("---->The id is : "+value.id.toString() +"   The quantity is: "+value.quantity.toString()+"   Name is:"+value.name.toString());
      });

    update(); //same as setState(){}
  }

  //getter to get all cart items
  int get totalItems{
    return _cart.totalItems;
  }

}