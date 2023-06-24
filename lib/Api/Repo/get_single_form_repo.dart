import 'dart:developer';
import '../Model/Response/get_single_form_response_model.dart';
import '../api_handlers.dart';
import '../api_routs.dart';

class GetSingleFormsRepo extends BaseService {
  static Future getSingleFormRepo(String userId, String formID) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: '${BaseService.getSingleFormUrl}/$userId/$formID',
    );

    GetSingleResponseModel getSingleResponseModel =
        GetSingleResponseModel.fromJson(response);

    log('-----------------------$response');
    log('-----------------------${BaseService.getSingleFormUrl}/$userId/$formID');

    return getSingleResponseModel;
  }
}
