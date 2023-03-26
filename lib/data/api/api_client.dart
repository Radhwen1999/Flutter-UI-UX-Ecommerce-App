import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeaders;
  ApiClient({required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    timeout=const Duration(seconds: 30);
    token=AppConstants.TOKEN;
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  void updateHeader(String token){
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }

  Future <Response> getData(String uri,/*Map<String,String>?headers*/) async {
    try{
      Response response=await get(uri,
      /*headers:headers?? _mainHeaders*/);
      return response;
    }catch(e){
        return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body)async{
    try{
    Response response=await post(uri, body,headers: _mainHeaders);
    return response;
  }catch(e){
      print(e.toString());
      return Response(statusText: e.toString(),statusCode: 1);
  }
  }
}