class ApiResponseModel {
  bool isSuccess;
  String errorMessage;

  ApiResponseModel({
    this.isSuccess = false,
    this.errorMessage = '',
  });
}
