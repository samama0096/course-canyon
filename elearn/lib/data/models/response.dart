//sample data model for api response, it will be changed according to api response after backend dev.

class ResponseModel {
  final String error;
  final String msg;
  final int status;

  ResponseModel({
    required this.error,
    required this.msg,
    required this.status,
  });
}
