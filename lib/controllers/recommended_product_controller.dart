import 'package:get/get.dart';
import 'package:i_eats/data/repository/popular_product_repo.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/product.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = []; //"_" means its private
  List<dynamic> get recommendedProductList => _recommendedProductList; //make the private _popularProductList public

  bool _isLoaded = false;//private
  bool get isLoaded => _isLoaded;//public getter

  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print("----------->Got products recommended");
      _recommendedProductList =[];//clear data
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //print("-------> recommended products: $_popularProductList");
      _isLoaded = true;
      update(); //similar to set state
    }
    else{
      print("----------->Error: could not get products recommended");
    }
  }
}