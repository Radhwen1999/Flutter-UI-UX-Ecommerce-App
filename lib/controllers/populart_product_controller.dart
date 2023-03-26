import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muapp6/controllers/Cart_controller.dart';
import 'package:muapp6/data/repository/popular_product_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';


class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;
  late CartController _cartController;

  bool _isLoaded= false;
  bool get isLoaded =>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;

  Future<void> getPopularProductList() async {
    Response response=await popularProductRepo.getPopularProductList();
    if (response.statusCode==200){

      //print("got  products");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      //print(_popularProductList);
      _isLoaded=true;
      update();

    }
    else{

    }
  }


  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity=checkQuantity(_quantity+1);
    }else{
      _quantity=checkQuantity(_quantity-1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0){
      Get.snackbar("Veuillez vérifier", "Pas de produits à retirer",backgroundColor: Colors.purpleAccent,colorText: Color(0xFFFFF8E1));
      if(_inCartItems>0){
        _quantity=-_inCartItems;
        return _quantity;
      }
      return 0;}
    else if((_inCartItems+quantity)>20){
      Get.snackbar("Veuillez vérifier", "Maximum déja achevé",backgroundColor: Colors.purpleAccent,colorText: Color(0xFFFFF8E1));
      return 20;}else{return quantity;}
  }

  void initProduct(ProductModel productModel,CartController cartController){
    _quantity=0;
    _cartController=cartController;
    var exist=false;
    exist = _cartController.existInCart(productModel);
    _inCartItems=0;
    if(exist){
      _inCartItems=_cartController.getQuantity( productModel);
    }

    // get from storage  _inCartItems
  }

  void addItem(ProductModel product){

    _cartController.addItem(product, quantity);
    _quantity=0;
    _inCartItems=_cartController.getQuantity(product);
    _cartController.items.forEach((key, value) {
      //print("the id is "+value.id.toString()+" quantity is "+value.quantity.toString());
    });

    update();
  }

  int get totalItems{
    return _cartController.totalItems;
  }

  List<CartModel> get getItems{
    return _cartController.getItems;
  }

}