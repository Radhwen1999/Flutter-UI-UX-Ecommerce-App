import 'package:get/get.dart';
import 'package:muapp6/data/repository/user_repo.dart';
import 'package:muapp6/models/user_model.dart';

import '../models/response_model.dart';


class UserController extends GetxController implements GetxService{
  final UserRepo userRepo;
  UserController({required this.userRepo});

  late UserModel _userModel;
  UserModel get userModel=> _userModel;
  bool _isLoading =false;
  bool get isLoading=>_isLoading;
  Future<ResponseModel>getUserInfo() async {
    _isLoading=true;
    update();
    Response response=await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if(response.statusCode==200){
        _userModel=UserModel.fromJson(response.body);
       late ResponseModel responseModel;
      responseModel = ResponseModel(true,"successfully");
    }else{
      responseModel = ResponseModel(true, response.statusText!);
    }
    _isLoading=false;
    update();
    return responseModel;
  }
}