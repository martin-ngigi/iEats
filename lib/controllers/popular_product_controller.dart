import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_eats/data/repository/popular_product_repo.dart';
import 'package:i_eats/utils/colors.dart';

import '../models/product.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  
  List<dynamic> _popularProductList = []; //"_" means its private
  List<dynamic> get popularProductList => _popularProductList; //make the private _popularProductList public

  bool _isLoaded = false;//private
  bool get isLoaded => _isLoaded;//public getter

  int _quantity = 0;
  int get quantity => _quantity;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      print("----------->Got products");
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
    }
    else{
      _quantity = checkQuantity(_quantity-1);
    }

    update(); //same as setState(){}
  }

  int checkQuantity(int quantity){
    // quantity should not be less than 0 or 20
    if(quantity<0){
      //show message
      Get.snackbar("Item count", "You cant reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white
      );
      return 0;
    }
    else if(quantity>20){
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
  void initProduct(){
    _quantity =0;
  }
}