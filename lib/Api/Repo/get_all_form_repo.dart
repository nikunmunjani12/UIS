import 'dart:developer';
import '../Model/Response/get_all_form_response_model.dart';
import '../api_handlers.dart';
import '../api_routs.dart';

class GetAllFormsRepo extends BaseService {
  static Future getAllFormRepo(String userId) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: '${BaseService.getAllFormsUrl}/$userId',
    );

    GetAllFormsResponseModel1 getAllFormsResponseModel =
        GetAllFormsResponseModel1.fromJson(response);

    log('-----------------------$response');
    log('-----------------------${BaseService.getAllFormsUrl}/$userId');

    return getAllFormsResponseModel;
  }
}
