import 'dart:io';

import 'package:food_delivery/helper/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({ required this.popularProductRepo});
  // call the repo, repo would return data
  List<dynamic> _popularProductList = []; //private variable
  List<dynamic> get popularProductList => _popularProductList;


  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      //print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      update();
    }else{

    }
  }
}