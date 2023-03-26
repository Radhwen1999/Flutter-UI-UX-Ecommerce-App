import 'package:get/get.dart';
import 'package:muapp6/data/repository/popular_product_repo.dart';
import '../data/repository/nov_app_repo.dart';
import '../models/products_model.dart';


class NovAppController extends GetxController{
  final NovAppRepo novAppRepo;
  NovAppController({required this.novAppRepo});
  List<ProductModel> _novAppList=[];
  List<ProductModel> get novAppList=>_novAppList;

  bool _isLoaded= false;
  bool get isLoaded =>_isLoaded;


  Future<void> getNovAppList() async {
    Response response=await novAppRepo.getNovAppList();
    if (response.statusCode==200){

      //print("got  novApp");
      _novAppList=[];
      _novAppList.addAll(Product.fromJson(response.body).products);

      //print(_novAppList);
      _isLoaded=true;
      update();

    }
    else{
      print("got not novApp");
    }
  }
}