import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:muapp6/data/api/api_client.dart';
import 'package:muapp6/utils/app_constants.dart';

class NovAppRepo extends GetxService {
  final ApiClient apiClient;

  NovAppRepo({required this.apiClient});

  Future<Response> getNovAppList() async {
    return await apiClient.getData(AppConstants.NOV_APP_URI);
  }
}
