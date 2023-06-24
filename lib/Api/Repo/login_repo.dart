import 'dart:developer';

import '../Model/Response/login_response_model.dart';
import '../api_handlers.dart';
import '../api_routs.dart';

class LoginRepo extends BaseService {
  Future loginRepo({required Map<String, dynamic> body}) async {
    log('BaseService.loginUrl ==> ${BaseService.loginUrl}');

    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: BaseService.loginUrl, body: body);

    log('response ==> $response');

    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(response);

    return loginResponseModel;
  }
}
