import 'package:muapp6/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel?productModel;

  CartModel(
      {this.id,
        this.quantity,
        this.time,
        this.isExist,
        this.name,
        this.price,
        this.img,
        this.productModel,
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity =json['quantity'];
    isExist =json['isExist'];
    time =json['time'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    productModel=ProductModel.fromJson(json['product']);
  }
  Map<String,dynamic> toJson(){
    return{
      "id":this.id,
      "name":this.name,
      "price":this.price,
      "img":this.img,
      "quantity":this.quantity,
      "isExist":this.isExist,
      "time":this.time,
      "product":this.productModel!.toJson(),

    };
  }

}



