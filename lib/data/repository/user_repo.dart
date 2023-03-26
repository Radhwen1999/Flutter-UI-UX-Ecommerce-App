import 'package:muapp6/data/api/api_client.dart';
import 'package:muapp6/models/user_model.dart';
import 'package:muapp6/utils/app_constants.dart';
import 'package:get/get.dart';
class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});
  Future<Response> getUserInfo()async{
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}