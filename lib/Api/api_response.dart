import 'package:uisapp/Api/Model/Response/get_all_form_response_model.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  Status status;

  ApiResponse.initial({this.message}) : status = Status.INITIAL;

  ApiResponse.loading({this.message}) : status = Status.LOADING;

  ApiResponse.complete([this.data]) : status = Status.COMPLETE;
  ApiResponse.error({this.message}) : status = Status.ERROR;

  String getString() {
    return 'Status : $status message : $message data : $data';
  }
}

enum Status { INITIAL, LOADING, COMPLETE, ERROR }

///ONLY USE//////////////////////////////
