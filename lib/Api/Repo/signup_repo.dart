import 'dart:developer';

import '../Model/Response/signup_response_model.dart';
import '../api_handlers.dart';
import '../api_routs.dart';

class SignUpRepo extends BaseService {
  static Future signUpRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: BaseService.registerUrl, body: body);
    print('++++++++++++++++++++++++RESPONSE   $response');
    SignUpResponseModel signUpResponseModel =
        SignUpResponseModel.fromJson(response);

    log('-----------------------$response');
    log('-----------------------${BaseService.registerUrl}');
    return signUpResponseModel;
  }
}