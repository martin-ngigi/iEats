import 'package:get/get.dart';
import 'package:i_eats/data/repository/popular_product_repo.dart';

import '../models/product.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  
  List<dynamic> _popularProductList = []; //"_" means its private
  List<dynamic> get popularProductList => _popularProductList; //make the private _popularProductList public
  
  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      print("----------->Got products");
      _popularProductList =[];//clear data
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print("-------> Popular products: $_popularProductList");
      update(); //similar to set state
    }
    else{

    }
  }
}