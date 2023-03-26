import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muapp6/data/repository/cart_repo.dart';
import 'package:muapp6/models/products_model.dart';

import '../models/cart_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int,CartModel> _items={};
  Map<int,CartModel> get items=>_items;
  List<CartModel> storageItems=[];


  void addItem(ProductModel product,int quantity){
    var totalQuantity=0;
    if(_items.containsKey(product.id!)){
        _items.update(product.id!, (value) {

          totalQuantity=value.quantity!+quantity;

          return CartModel(
            id:product.id,
            quantity:value.quantity!+quantity,
            time: DateTime.now().toString(),
            isExist:true,
            name:product.name,
            price:product.price,
            img:product.img,
            productModel: product,
          );
        });
        if(totalQuantity<=0){
          _items.remove(product.id);
        }
    }else{
      if(quantity>0){
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id:product.id,
            quantity:quantity,
            time: DateTime.now().toString(),
            isExist:true,
            name:product.name,
            price:product.price,
            img:product.img,
            productModel: product,
          );});
      }else{
        Get.snackbar("Veuillez vérifier", "Ajouter au moins 1 article",backgroundColor: Colors.purpleAccent,colorText: Color(0xFFFFF8E1));
      }
      }
    cartRepo.addToCardList(getItems);
    update();
  }

  bool existInCart(ProductModel productModel){
    if(_items.containsKey(productModel.id)){
      return true;
    }else{return false;}
  }

  int getQuantity(ProductModel productModel){
    var quantity=0;
    if (_items.containsKey(productModel.id)){
      _items.forEach((key, value) {
        if(key==productModel.id){
          quantity=value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value) {
      totalQuantity+=value.quantity!;
    });

    return totalQuantity;
}

  List<CartModel> get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
  int get getTotalAmount{
    var total=0;
    _items.forEach((key, value) {
      total+=value.quantity!*value.price!;
    });
    return total;
  }

  List<CartModel> getCartData(){
    setCart=cartRepo.getCartList();

    return storageItems;
  }

  set setCart(List<CartModel> items){
    storageItems=items;
    for(int i=0 ;i<storageItems.length;i++){
      _items.putIfAbsent(storageItems[i].productModel!.id!, () => storageItems[i]);
    }
  }
  void addToHistory(){
    cartRepo.addToCartHistoryList();
    clear();
  }
  void clear(){
    _items={};
    update();
  }
  List<CartModel> getCartHistoryList(){
    return cartRepo.getCartHistoryList();
  }
  set setItems(Map<int,CartModel> setItems){
    _items={};
    _items=setItems;
  }
  void addToCartList(){
    cartRepo.addToCardList(getItems);
    update();
  }
  void clearCartHistory(){
    cartRepo.clearCartHistory();
    update();
  }
}